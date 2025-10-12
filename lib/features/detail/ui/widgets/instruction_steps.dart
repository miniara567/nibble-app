import 'package:flutter/material.dart';
import 'package:viral_recipes_app/features/detail/data/recipe_detail_models.dart';
import 'package:viral_recipes_app/shared/design_system/tokens.dart';

class InstructionSteps extends StatelessWidget {
  const InstructionSteps({super.key, required this.steps});

  final List<InstructionDetail> steps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Instructions', style: theme.textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            ...steps.map((step) => _StepRow(step: step)).toList(),
          ],
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({required this.step});

  final InstructionDetail step;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              step.order.toString(),
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onPrimaryContainer),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(step.description, style: theme.textTheme.bodyLarge),
                if (step.timestampSeconds != null)
                  Text(
                    'Timestamp: ${_formatTimestamp(step.timestampSeconds!)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(int seconds) {
    final minutes = seconds ~/ 60;
    final remainder = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainder.toString().padLeft(2, '0')}';
  }
}
