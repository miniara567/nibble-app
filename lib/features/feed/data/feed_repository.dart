import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';
import 'package:viral_recipes_app/app/providers.dart';
import 'package:viral_recipes_app/app/telemetry/analytics_service.dart';
import 'package:viral_recipes_app/features/feed/data/feed_models.dart';
import 'package:viral_recipes_app/shared/analytics/feature_flag_service.dart';
import 'package:viral_recipes_app/shared/network/models/recipe_dto.dart';
import 'package:viral_recipes_app/shared/network/viral_api_client.dart';
import 'package:viral_recipes_app/shared/storage/hive_cache.dart';

class FeedRequest {
  const FeedRequest({
    this.limit = 20,
    this.cursor,
    this.tag,
    this.platform,
    this.breakpointLabel = 'desktop',
    this.forceRefresh = false,
  });

  final int limit;
  final String? cursor;
  final String? tag;
  final String? platform;
  final String breakpointLabel;
  final bool forceRefresh;

  FeedRequest copyWith({
    int? limit,
    String? cursor,
    String? tag,
    String? platform,
    String? breakpointLabel,
    bool? forceRefresh,
  }) {
    return FeedRequest(
      limit: limit ?? this.limit,
      cursor: cursor ?? this.cursor,
      tag: tag ?? this.tag,
      platform: platform ?? this.platform,
      breakpointLabel: breakpointLabel ?? this.breakpointLabel,
      forceRefresh: forceRefresh ?? this.forceRefresh,
    );
  }
}

class FeedRepository {
  FeedRepository({
    required ViralApiClient apiClient,
    required HiveCacheService cacheService,
    required FeatureFlagService? featureFlagService,
    required AnalyticsService? analyticsService,
  })  : _apiClient = apiClient,
        _cacheService = cacheService,
        _featureFlagService = featureFlagService,
        _analyticsService = analyticsService;

  final ViralApiClient _apiClient;
  final HiveCacheService _cacheService;
  final FeatureFlagService? _featureFlagService;
  final AnalyticsService? _analyticsService;

  static const _cachePrefix = 'feed';

  Future<FeedPage> fetchFeed(FeedRequest request) async {
    final flagEnabled = _featureFlagService?.isFeedEnabled ?? true;
    if (!flagEnabled) {
      throw FeedFailure('Feed is disabled via feature flag');
    }

    await _cacheService.init();
    final cacheKey = _buildCacheKey(request);

    if (!request.forceRefresh) {
      final cached = _cacheService.readFeedSnapshot(cacheKey);
      if (cached != null) {
        final cachedPage = FeedPage.fromJson(cached);
        _analyticsService?.logFeedView(breakpoint: request.breakpointLabel);
        return cachedPage;
      }
    }

    try {
      final dto = await _apiClient.fetchRecipes(
        limit: request.limit,
        cursor: request.cursor,
        platform: request.platform,
        tag: request.tag,
      );
      final page = FeedPage(
        items: dto.items.map(_mapSummary).toList(),
        nextCursor: dto.nextCursor,
      );
      unawaited(_cacheService.writeFeedSnapshot(cacheKey, page.toJson()));
      _analyticsService?.logFeedView(breakpoint: request.breakpointLabel);
      return page;
    } catch (error, stackTrace) {
      debugPrint('Feed request failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      final cached = _cacheService.readFeedSnapshot(cacheKey);
      if (cached != null) {
        return FeedPage.fromJson(cached);
      }
      // If no cache is available, surface curated sample data to keep UX usable.
      return FeedPage(
        items: _sampleData.take(request.limit).toList(),
        nextCursor: null,
      );
    }
  }

  String _buildCacheKey(FeedRequest request) {
    return [
      _cachePrefix,
      request.breakpointLabel,
      request.tag ?? 'all',
      request.platform ?? 'all',
    ].join(':');
  }

  RecipeSummary _mapSummary(RecipeSummaryDto dto) {
    return RecipeSummary(
      id: dto.id,
      title: dto.title,
      summary: dto.summary ?? '',
      heroImageUrl: dto.heroImageUrl,
      platform: dto.platform,
      confidence: dto.confidence,
      tags: dto.tags,
      durationSeconds: dto.durationSeconds,
      viewCount: dto.viewCount,
    );
  }
}

final feedRepositoryProvider = Provider<FeedRepository>((ref) {
  final apiClient = ref.watch(dioProvider);

  FeatureFlagService? featureFlagService;
  final remoteConfig = ref.watch(remoteConfigProvider);
  if (remoteConfig != null) {
    featureFlagService = FeatureFlagService(remoteConfig);
  }

  AnalyticsService? analyticsService;
  final analytics = ref.watch(firebaseAnalyticsProvider);
  if (analytics != null) {
    analyticsService = AnalyticsService(analytics);
  }
  final baseUrl = const String.fromEnvironment(
    'INGESTION_API_BASE_URL',
    defaultValue: 'https://api.example.com',
  );

  final client = ViralApiClient(
    dio: apiClient,
    baseUrl: baseUrl,
  );

  return FeedRepository(
    apiClient: client,
    cacheService: HiveCacheService(),
    featureFlagService: featureFlagService,
    analyticsService: analyticsService,
  );
});

final _sampleImages = <String>[
  'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe',
  'https://images.unsplash.com/photo-1518987048-93e29699e79b',
  'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9',
  'https://images.unsplash.com/photo-1512058564366-18510be2db19',
  'https://images.unsplash.com/photo-1482049016688-2d3e1b311543',
];

final _sampleData = List.generate(12, (index) {
  final random = Random(index);
  final imageUrl = _sampleImages[index % _sampleImages.length];
  final tags = [
    'quick',
    if (index.isEven) 'viral',
    if (index.isOdd) 'comfort',
    if (random.nextBool()) 'weeknight',
  ];
  return RecipeSummary(
    id: 'sample-$index',
    title: 'Viral recipe ${index + 1}',
    summary:
        'A crowd-favourite viral recipe featuring bold flavours and simple steps.',
    heroImageUrl: '$imageUrl?auto=format&fit=crop&w=960&q=80',
    platform: index.isEven ? 'tiktok' : 'instagram',
    confidence: 0.8 + (random.nextDouble() * 0.2),
    tags: tags,
    durationSeconds: 300 + (index * 30),
    viewCount: 500000 + (index * 10000),
  );
});
