import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:viral_recipes_app/app/providers.dart';
import 'package:viral_recipes_app/app/telemetry/analytics_service.dart';
import 'package:viral_recipes_app/features/submission/data/submission_models.dart';
import 'package:viral_recipes_app/shared/analytics/feature_flag_service.dart';
import 'package:viral_recipes_app/shared/network/models/submission_dto.dart';
import 'package:viral_recipes_app/shared/network/viral_api_client.dart';

class SubmissionRepository {
  SubmissionRepository({
    required ViralApiClient apiClient,
    required FeatureFlagService? featureFlagService,
    required AnalyticsService? analyticsService,
  })  : _apiClient = apiClient,
        _featureFlagService = featureFlagService,
        _analyticsService = analyticsService;

  final ViralApiClient _apiClient;
  final FeatureFlagService? _featureFlagService;
  final AnalyticsService? _analyticsService;

  Future<SubmissionModel> submit(SubmissionRequestModel request) async {
    if (!(_featureFlagService?.isFeedEnabled ?? true)) {
      throw Exception('Submissions disabled');
    }
    _analyticsService?.logSubmissionStart(platform: _detectPlatform(request.url));
    try {
      final dto = await _apiClient.submitVideo(
        videoUrl: request.url,
        contactEmail: request.contactEmail,
        notes: request.notes,
      );
      return _map(dto);
    } catch (error, stackTrace) {
      debugPrint('Submission failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return SubmissionModel(
        id: 'local-${DateTime.now().millisecondsSinceEpoch}',
        url: request.url,
        status: SubmissionStatus.failed,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        failureReason: 'Unable to submit at this time.',
      );
    }
  }

  Future<SubmissionModel> pollStatus(String id) async {
    try {
      final dto = await _apiClient.getSubmissionStatus(id);
      return _map(dto);
    } catch (error, stackTrace) {
      debugPrint('Polling failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return SubmissionModel(
        id: id,
        url: '',
        status: SubmissionStatus.failed,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        failureReason: 'Unable to fetch status.',
      );
    }
  }

  SubmissionModel _map(SubmissionDto dto) {
    return SubmissionModel(
      id: dto.id,
      url: dto.videoUrl,
      status: SubmissionStatus.values.firstWhere(
        (status) => status.name == dto.status,
        orElse: () => SubmissionStatus.processing,
      ),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      estimatedCompletionMinutes: dto.estimatedCompletionMinutes,
      failureReason: dto.failureReason,
    );
  }

  String _detectPlatform(String url) {
    if (url.contains('tiktok')) return 'tiktok';
    if (url.contains('instagram') || url.contains('threads')) return 'instagram';
    if (url.contains('youtube')) return 'youtube';
    return 'unknown';
  }
}

final submissionRepositoryProvider = Provider<SubmissionRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = const String.fromEnvironment(
    'INGESTION_API_BASE_URL',
    defaultValue: 'https://api.example.com',
  );
  final client = ViralApiClient(dio: dio, baseUrl: baseUrl);

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

  return SubmissionRepository(
    apiClient: client,
    featureFlagService: featureFlagService,
    analyticsService: analyticsService,
  );
});
