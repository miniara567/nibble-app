import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:viral_recipes_app/features/feed/data/feed_models.dart';
import 'package:viral_recipes_app/features/feed/data/feed_repository.dart';
import 'package:viral_recipes_app/shared/network/models/recipe_dto.dart';
import 'package:viral_recipes_app/shared/network/viral_api_client.dart';
import 'package:viral_recipes_app/shared/storage/hive_cache.dart';

class _MockApiClient extends Mock implements ViralApiClient {}

class _FakeCacheService extends Fake implements HiveCacheService {
  final Map<String, Map<String, dynamic>> _store = {};

  @override
  Future<void> init() async {}

  @override
  Future<void> writeFeedSnapshot(String key, Map<String, dynamic> payload) async {
    _store[key] = payload;
  }

  @override
  Map<String, dynamic>? readFeedSnapshot(String key) => _store[key];
}

void main() {
  group('FeedRepository', () {
    late _MockApiClient apiClient;
    late _FakeCacheService cache;
    late FeedRepository repository;

    setUp(() {
      apiClient = _MockApiClient();
      cache = _FakeCacheService();
      repository = FeedRepository(
        apiClient: apiClient,
        cacheService: cache,
        featureFlagService: null,
        analyticsService: null,
      );
    });

    FeedRequest request() => const FeedRequest(breakpointLabel: 'desktop');

    test('maps API results into domain model', () async {
      when(() => apiClient.fetchRecipes(
            limit: any(named: 'limit'),
            cursor: any(named: 'cursor'),
            tag: any(named: 'tag'),
            platform: any(named: 'platform'),
          )).thenAnswer((_) async => RecipeCollectionDto(
            items: [
              RecipeSummaryDto(
                id: '123',
                title: 'Test Recipe',
                summary: 'Summary',
                heroImageUrl: 'https://example.com/image.jpg',
                confidence: 0.9,
                platform: 'tiktok',
              ),
            ],
            nextCursor: 'next',
          ));

      final page = await repository.fetchFeed(request());

      expect(page.items, hasLength(1));
      final recipe = page.items.single;
      expect(recipe.id, '123');
      expect(recipe.title, 'Test Recipe');
      expect(recipe.platform, 'tiktok');
      expect(page.nextCursor, 'next');
    });

    test('returns cached data when API fails', () async {
      final cachedPage = FeedPage(
        items: const [
          RecipeSummary(
            id: 'cached',
            title: 'Cached Recipe',
            summary: 'Fallback summary',
            heroImageUrl: 'https://example.com/cached.jpg',
            platform: 'instagram',
            confidence: 0.8,
            tags: ['cached'],
            durationSeconds: 120,
            viewCount: 1000,
          ),
        ],
        nextCursor: null,
      );
      await cache.writeFeedSnapshot('feed:desktop:all:all', cachedPage.toJson());

      when(() => apiClient.fetchRecipes(
            limit: any(named: 'limit'),
            cursor: any(named: 'cursor'),
            tag: any(named: 'tag'),
            platform: any(named: 'platform'),
          )).thenThrow(Exception('network error'));

      final page = await repository.fetchFeed(request());

      expect(page.items, hasLength(1));
      expect(page.items.first.id, 'cached');
    });

    test('surfaces curated sample data when no cache available', () async {
      when(() => apiClient.fetchRecipes(
            limit: any(named: 'limit'),
            cursor: any(named: 'cursor'),
            tag: any(named: 'tag'),
            platform: any(named: 'platform'),
          )).thenThrow(Exception('network error'));

      final page = await repository.fetchFeed(request());

      expect(page.items, isNotEmpty);
      expect(page.items.first.title, contains('Viral recipe'));
    });
  });
}
