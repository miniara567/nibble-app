import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viral_recipes_app/features/feed/data/feed_models.dart';
import 'package:viral_recipes_app/shared/design_system/tokens.dart';

class ViralRecipeCard extends StatelessWidget {
  const ViralRecipeCard({super.key, required this.recipe});

  final RecipeSummary recipe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: recipe.heroImageUrl,
              fit: BoxFit.cover,
              placeholder: (context, _) => const DecoratedBox(
                decoration: BoxDecoration(color: Colors.black12),
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (_, __, ___) => const DecoratedBox(
                decoration: BoxDecoration(color: Colors.black12),
                child: Icon(Icons.no_photography),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(
                      avatar: Icon(
                        recipe.platform == 'tiktok'
                            ? Icons.music_video
                            : Icons.play_circle,
                        size: 16,
                      ),
                      label: Text(recipe.platform.toUpperCase()),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: AppRadius.pill,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xs,
                        ),
                        child: Text(
                          'Confidence ${(recipe.confidence * 100).round()}%',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  recipe.title,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  recipe.summary,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: recipe.tags
                      .map(
                        (tag) => Chip(
                          label: Text('#$tag'),
                          visualDensity: VisualDensity.compact,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _FactRow(
                      icon: Icons.timer_outlined,
                      label: _formatDuration(recipe.durationSeconds),
                    ),
                    _FactRow(
                      icon: Icons.visibility_outlined,
                      label: _formatViews(recipe.viewCount),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(int? durationSeconds) {
    if (durationSeconds == null) return '—';
    final minutes = (durationSeconds / 60).round();
    return '$minutes min';
  }

  String _formatViews(int? views) {
    if (views == null) return '—';
    if (views >= 1000000) {
      return '${(views / 1000000).toStringAsFixed(1)}M views';
    }
    if (views >= 1000) {
      return '${(views / 1000).toStringAsFixed(1)}K views';
    }
    return '$views views';
  }
}

class _FactRow extends StatelessWidget {
  const _FactRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: AppSpacing.xs),
        Text(label),
      ],
    );
  }
}
