import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_recipes_app/features/feed/data/feed_models.dart';
import 'package:viral_recipes_app/features/feed/data/feed_repository.dart';
import 'package:viral_recipes_app/features/feed/state/feed_state.dart';

final feedControllerProvider =
    StateNotifierProvider.autoDispose<FeedController, FeedState>((ref) {
  final repository = ref.watch(feedRepositoryProvider);
  final controller = FeedController(repository);
  ref.onDispose(controller.dispose);
  return controller;
});

class FeedController extends StateNotifier<FeedState> {
  FeedController(this._repository) : super(const FeedState());

  final FeedRepository _repository;
  bool _loadingMore = false;

  Future<void> loadInitial({String breakpointLabel = 'desktop'}) async {
    state = state.copyWith(
      status: FeedStatus.loading,
      breakpointLabel: breakpointLabel,
      errorMessage: null,
    );
    await _loadPage(forceRefresh: true);
  }

  Future<void> refresh() async {
    await _loadPage(forceRefresh: true);
  }

  Future<void> loadMore() async {
    if (_loadingMore || !state.hasMore) return;
    _loadingMore = true;
    try {
      final request = FeedRequest(
        limit: 20,
        cursor: state.nextCursor,
        tag: state.appliedTag,
        platform: state.appliedPlatform,
        breakpointLabel: state.breakpointLabel,
      );
      final page = await _repository.fetchFeed(request);
      state = state.copyWith(
        items: [...state.items, ...page.items],
        hasMore: page.nextCursor != null,
        nextCursor: page.nextCursor,
        status: FeedStatus.loaded,
      );
    } catch (error) {
      state = state.copyWith(
        status: FeedStatus.error,
        errorMessage: error.toString(),
      );
    } finally {
      _loadingMore = false;
    }
  }

  Future<void> applyFilter({String? tag, String? platform}) async {
    state = state.copyWith(
      appliedTag: tag,
      appliedPlatform: platform,
    );
    await _loadPage(forceRefresh: true);
  }

  Future<void> _loadPage({bool forceRefresh = false}) async {
    try {
      final request = FeedRequest(
        limit: 20,
        cursor: forceRefresh ? null : state.nextCursor,
        tag: state.appliedTag,
        platform: state.appliedPlatform,
        breakpointLabel: state.breakpointLabel,
        forceRefresh: forceRefresh,
      );
      final page = await _repository.fetchFeed(request);
      state = state.copyWith(
        status: FeedStatus.loaded,
        items: page.items,
        hasMore: page.nextCursor != null,
        nextCursor: page.nextCursor,
        errorMessage: null,
      );
    } catch (error) {
      state = state.copyWith(
        status: FeedStatus.error,
        errorMessage: error.toString(),
      );
    }
  }
}
