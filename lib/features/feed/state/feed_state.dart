import 'package:equatable/equatable.dart';
import 'package:viral_recipes_app/features/feed/data/feed_models.dart';

enum FeedStatus { initial, loading, loaded, error }

class FeedState extends Equatable {
  const FeedState({
    this.status = FeedStatus.initial,
    this.items = const <RecipeSummary>[],
    this.errorMessage,
    this.hasMore = false,
    this.nextCursor,
    this.appliedTag,
    this.appliedPlatform,
    this.breakpointLabel = 'desktop',
  });

  final FeedStatus status;
  final List<RecipeSummary> items;
  final String? errorMessage;
  final bool hasMore;
  final String? nextCursor;
  final String? appliedTag;
  final String? appliedPlatform;
  final String breakpointLabel;

  FeedState copyWith({
    FeedStatus? status,
    List<RecipeSummary>? items,
    String? errorMessage,
    bool? hasMore,
    String? nextCursor,
    String? appliedTag,
    String? appliedPlatform,
    String? breakpointLabel,
  }) {
    return FeedState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage,
      hasMore: hasMore ?? this.hasMore,
      nextCursor: nextCursor ?? this.nextCursor,
      appliedTag: appliedTag ?? this.appliedTag,
      appliedPlatform: appliedPlatform ?? this.appliedPlatform,
      breakpointLabel: breakpointLabel ?? this.breakpointLabel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        items,
        errorMessage,
        hasMore,
        nextCursor,
        appliedTag,
        appliedPlatform,
        breakpointLabel,
      ];
}
