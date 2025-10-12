import 'package:flutter/material.dart';
import 'package:viral_recipes_app/shared/design_system/tokens.dart';

class DetailActionBar extends StatelessWidget {
  const DetailActionBar({
    super.key,
    required this.sourceUrl,
    required this.onCopy,
  });

  final String sourceUrl;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        FilledButton.icon(
          onPressed: onCopy,
          icon: const Icon(Icons.copy_outlined),
          label: const Text('Copy link'),
        ),
        const SizedBox(width: AppSpacing.sm),
        OutlinedButton.icon(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) => _SourceSheet(sourceUrl: sourceUrl),
            );
          },
          icon: const Icon(Icons.info_outline),
          label: const Text('Source info'),
        ),
        const Spacer(),
        IconButton(
          tooltip: 'Mark for later',
          onPressed: () {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(const SnackBar(content: Text('Saved to favorites (mock).')));
          },
          icon: Icon(Icons.bookmark_border, color: theme.colorScheme.primary),
        ),
      ],
    );
  }
}

class _SourceSheet extends StatelessWidget {
  const _SourceSheet({required this.sourceUrl});

  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Original Source', style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          SelectableText(sourceUrl, style: theme.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Open this link to view the original social media upload. '
            'In the future we will deep link directly within the app.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}
