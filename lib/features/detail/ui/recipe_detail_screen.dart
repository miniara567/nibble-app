import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_recipes_app/features/detail/data/recipe_detail_models.dart';
import 'package:viral_recipes_app/features/detail/state/recipe_detail_controller.dart';
import 'package:viral_recipes_app/features/detail/state/recipe_detail_state.dart';
import 'package:viral_recipes_app/features/detail/ui/widgets/detail_action_bar.dart';
import 'package:viral_recipes_app/features/detail/ui/widgets/ingredient_list.dart';
import 'package:viral_recipes_app/features/detail/ui/widgets/instruction_steps.dart';
import 'package:viral_recipes_app/shared/design_system/tokens.dart';

class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({super.key, required this.recipeId});

  static const routeName = 'recipe-detail';

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipeDetailControllerProvider(recipeId));
    return Scaffold(
      appBar: AppBar(
        title: Text(state.detail?.title ?? 'Recipe'),
      ),
      body: switch (state.status) {
        RecipeDetailStatus.initial ||
        RecipeDetailStatus.loading => const Center(child: CircularProgressIndicator()),
        RecipeDetailStatus.error => _ErrorView(
            message: state.errorMessage ?? 'Unable to load recipe',
            onRetry: () => ref
                .read(recipeDetailControllerProvider(recipeId).notifier)
                .load(),
          ),
        RecipeDetailStatus.loaded => _DetailView(detail: state.detail!),
      },
    );
  }
}

class _DetailView extends StatelessWidget {
  const _DetailView({required this.detail});

  final RecipeDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  detail.heroImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black12),
                    child: Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.xs,
                      children: [
                        Chip(
                          label: Text(detail.platform.toUpperCase()),
                          avatar: const Icon(Icons.play_circle_fill, size: 16),
                        ),
                        Chip(
                          label: Text(detail.creatorHandle),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondaryContainer,
                            borderRadius: AppRadius.pill,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                              vertical: AppSpacing.xs,
                            ),
                            child: Text(
                              'Confidence ${(detail.confidence * 100).round()}%',
                              style: theme.textTheme.labelLarge
                                  ?.copyWith(color: theme.colorScheme.onSecondaryContainer),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(detail.title, style: theme.textTheme.headlineMedium),
                    const SizedBox(height: AppSpacing.sm),
                    Text(detail.summary, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: AppSpacing.md),
                    DetailActionBar(
                      sourceUrl: detail.sourceUrl,
                      onCopy: () async {
                        await Clipboard.setData(ClipboardData(text: detail.sourceUrl));
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(const SnackBar(content: Text('Link copied to clipboard.')));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              IngredientList(ingredients: detail.ingredients),
              const SizedBox(height: AppSpacing.lg),
              InstructionSteps(steps: detail.steps),
              const SizedBox(height: AppSpacing.lg),
              if (detail.nutrition != null)
                _NutritionCard(nutrition: detail.nutrition!),
              if (detail.transcript.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                _TranscriptView(transcript: detail.transcript),
              ],
              const SizedBox(height: AppSpacing.lg),
            ]),
          ),
        ),
      ],
    );
  }
}

class _NutritionCard extends StatelessWidget {
  const _NutritionCard({required this.nutrition});

  final NutritionDetail nutrition;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nutrition (per serving)', style: theme.textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.md,
              children: [
                _NutritionPill(label: 'Calories', value: nutrition.calories?.toString() ?? '—'),
                _NutritionPill(label: 'Protein', value: _formatGrams(nutrition.proteinGrams)),
                _NutritionPill(label: 'Carbs', value: _formatGrams(nutrition.carbsGrams)),
                _NutritionPill(label: 'Fat', value: _formatGrams(nutrition.fatGrams)),
              ],
            ),
            if (nutrition.notes != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(nutrition.notes!, style: theme.textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }

  String _formatGrams(double? grams) => grams == null ? '—' : '${grams.toStringAsFixed(1)} g';
}

class _NutritionPill extends StatelessWidget {
  const _NutritionPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      label: Text('$label: $value'),
      backgroundColor: theme.colorScheme.surfaceVariant,
    );
  }
}

class _TranscriptView extends StatelessWidget {
  const _TranscriptView({required this.transcript});

  final List<TranscriptSegment> transcript;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transcript', style: theme.textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            ...transcript.map(
              (segment) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: '[${segment.startSeconds.round()}s] ',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: segment.text),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          const SizedBox(height: AppSpacing.sm),
          FilledButton(onPressed: onRetry, child: const Text('Try again')),
        ],
      ),
    );
  }
}
