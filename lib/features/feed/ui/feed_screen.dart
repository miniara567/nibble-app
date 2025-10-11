import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_recipes_app/features/feed/state/feed_controller.dart';
import 'package:viral_recipes_app/features/feed/state/feed_state.dart';
import 'package:viral_recipes_app/features/feed/ui/widgets/feed_filter_bar.dart';
import 'package:viral_recipes_app/features/feed/ui/widgets/viral_recipe_card.dart';
import 'package:viral_recipes_app/shared/design_system/tokens.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  static const routeName = 'feed';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(feedControllerProvider);
    final controller = ref.read(feedControllerProvider.notifier);

    ref.listen<FeedState>(
      feedControllerProvider,
      (previous, next) {
        if (next.status == FeedStatus.error && next.errorMessage != null) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(content: Text(next.errorMessage!)),
            );
        }
      },
    );

    final width = MediaQuery.sizeOf(context).width;
    final breakpointLabel = _breakpointLabel(width);

    if (state.status == FeedStatus.initial ||
        state.breakpointLabel != breakpointLabel && state.status != FeedStatus.loading) {
      controller.loadInitial(breakpointLabel: breakpointLabel);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Viral Recipes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refresh,
            tooltip: 'Refresh feed',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FeedFilterBar(
                selectedTag: state.appliedTag,
                selectedPlatform: state.appliedPlatform,
                onTagSelected: (value) => controller.applyFilter(tag: value),
                onPlatformSelected: (value) =>
                    controller.applyFilter(platform: value),
              ),
            ),
            if (state.status == FeedStatus.loading && state.items.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: AppSpacing.md),
                      Text('Loading viral recipes…'),
                    ],
                  ),
                ),
              )
            else if (state.items.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text('No viral recipes available yet.')),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                sliver: SliverList.separated(
                  itemBuilder: (context, index) {
                    final recipe = state.items[index];
                    return ViralRecipeCard(recipe: recipe);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
                  itemCount: state.items.length,
                ),
              ),
            if (state.hasMore)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Center(
                    child: FilledButton.icon(
                      onPressed: controller.loadMore,
                      icon: const Icon(Icons.expand_more),
                      label: const Text('Load more'),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _breakpointLabel(double width) {
    if (width < AppBreakpoints.tablet) {
      return 'mobile';
    }
    if (width < AppBreakpoints.desktop) {
      return 'tablet';
    }
    return 'desktop';
  }
}
