import 'package:flutter/material.dart';
import 'package:viral_recipes_app/features/detail/data/recipe_detail_models.dart';
import 'package:viral_recipes_app/shared/design_system/tokens.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key, required this.ingredients});

  final List<IngredientDetail> ingredients;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients', style: theme.textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            ...ingredients.map(_IngredientRow.new),
          ],
        ),
      ),
    );
  }
}

class _IngredientRow extends StatelessWidget {
  const _IngredientRow(this.ingredient);

  final IngredientDetail ingredient;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final quantity = ingredient.quantity;
    final unit = ingredient.unit ?? '';
    final quantityText = quantity == null ? '' : _formatQuantity(quantity);
    final labelBuffer = StringBuffer();
    if (quantityText.isNotEmpty) labelBuffer.write('$quantityText ');
    if (unit.isNotEmpty) labelBuffer.write('$unit ');
    labelBuffer.write(ingredient.name);
    if (ingredient.preparation != null) {
      labelBuffer.write(' (${ingredient.preparation})');
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, size: 18),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(labelBuffer.toString(), style: theme.textTheme.bodyMedium),
          ),
          Text('${(ingredient.confidence * 100).round()}%',
              style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return quantity.toInt().toString();
    }
    final formatted = quantity.toStringAsFixed(2);
    return formatted.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  }
}
