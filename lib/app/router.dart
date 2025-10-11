import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:viral_recipes_app/features/detail/ui/recipe_detail_screen.dart';
import 'package:viral_recipes_app/features/feed/ui/feed_screen.dart';
import 'package:viral_recipes_app/features/submission/ui/submission_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: FeedScreen.routeName,
        builder: (context, state) => const FeedScreen(),
      ),
      GoRoute(
        path: '/recipes/:id',
        name: RecipeDetailScreen.routeName,
        builder: (context, state) {
          final recipeId = state.pathParameters['id'] ?? '';
          return RecipeDetailScreen(recipeId: recipeId);
        },
      ),
      GoRoute(
        path: '/submit',
        name: SubmissionScreen.routeName,
        builder: (context, state) => const SubmissionScreen(),
      ),
    ],
  );
});
