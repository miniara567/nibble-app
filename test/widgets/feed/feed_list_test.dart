import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:viral_recipes_app/features/feed/data/feed_models.dart';
import 'package:viral_recipes_app/features/feed/data/feed_repository.dart';
import 'package:viral_recipes_app/features/feed/ui/feed_screen.dart';
import 'package:viral_recipes_app/shared/network/models/recipe_dto.dart';
import 'package:viral_recipes_app/shared/network/viral_api_client.dart';
import 'package:viral_recipes_app/shared/storage/hive_cache.dart';

class _MockApiClient extends Mock implements ViralApiClient {}

class _FakeCacheService extends Fake implements HiveCacheService {
  @override
  Future<void> init() async {}

  @override
  Future<void> writeFeedSnapshot(String key, Map<String, dynamic> payload) async {}

  @override
  Map<String, dynamic>? readFeedSnapshot(String key) => null;
}

void main() {
  testWidgets('renders feed cards with data and supports filters', (tester) async {
    final apiClient = _MockApiClient();
    when(() => apiClient.fetchRecipes(
          limit: any(named: 'limit'),
          cursor: any(named: 'cursor'),
          tag: any(named: 'tag'),
          platform: any(named: 'platform'),
        )).thenAnswer((_) async => RecipeCollectionDto(
          items: [
            RecipeSummaryDto(
              id: '1',
              title: 'Sample Recipe',
              summary: 'A tasty viral dish.',
              heroImageUrl: 'https://example.com/image.jpg',
              confidence: 0.92,
              platform: 'tiktok',
              tags: const ['viral', 'quick'],
              durationSeconds: 420,
              viewCount: 1200000,
            ),
          ],
          nextCursor: null,
        ));

    final repository = FeedRepository(
      apiClient: apiClient,
      cacheService: _FakeCacheService(),
      featureFlagService: null,
      analyticsService: null,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          feedRepositoryProvider.overrideWithValue(repository),
        ],
        child: const MaterialApp(home: FeedScreen()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Sample Recipe'), findsOneWidget);
    expect(find.textContaining('#viral'), findsOneWidget);
    expect(find.text('Load more'), findsOneWidget);

    expect(find.text('All'), findsOneWidget);
    expect(find.text('viral'), findsOneWidget);
  });
}
