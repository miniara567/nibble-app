import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key, required this.recipeId});

  static const routeName = 'recipe-detail';

  final String recipeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe $recipeId')),
      body: const Center(
        child: Text('Recipe detail view coming soon'),
      ),
    );
  }
}
