import 'package:flutter/material.dart';
import 'package:viral_recipes_app/shared/design_system/tokens.dart';

typedef FilterCallback = void Function(String? value);

class FeedFilterBar extends StatelessWidget {
  const FeedFilterBar({
    super.key,
    required this.selectedTag,
    required this.selectedPlatform,
    required this.onTagSelected,
    required this.onPlatformSelected,
  });

  final String? selectedTag;
  final String? selectedPlatform;
  final FilterCallback onTagSelected;
  final FilterCallback onPlatformSelected;

  static const _availableTags = ['quick', 'viral', 'comfort', 'weeknight'];
  static const _platforms = ['tiktok', 'instagram'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              FilterChip(
                label: const Text('All'),
                selected: selectedTag == null,
                onSelected: (_) => onTagSelected(null),
              ),
              for (final tag in _availableTags)
                FilterChip(
                  label: Text(tag),
                  selected: selectedTag == tag,
                  onSelected: (value) => onTagSelected(value ? tag : null),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: [
              ChoiceChip(
                label: const Text('All platforms'),
                selected: selectedPlatform == null,
                onSelected: (_) => onPlatformSelected(null),
              ),
              for (final platform in _platforms)
                ChoiceChip(
                  label: Text(platform),
                  selected: selectedPlatform == platform,
                  onSelected: (value) =>
                      onPlatformSelected(value ? platform : null),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
