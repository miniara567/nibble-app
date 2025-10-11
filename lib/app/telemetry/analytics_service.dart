import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  AnalyticsService(this._analytics);

  final FirebaseAnalytics _analytics;

  Future<void> logFeedView({required String breakpoint}) {
    return _analytics.logEvent(
      name: 'feed_view',
      parameters: {
        'breakpoint': breakpoint,
      },
    );
  }

  Future<void> logRecipeOpen({required String recipeId}) {
    return _analytics.logEvent(
      name: 'recipe_open',
      parameters: {'recipe_id': recipeId},
    );
  }

  Future<void> logVideoPlay({required String recipeId}) {
    return _analytics.logEvent(
      name: 'video_play',
      parameters: {'recipe_id': recipeId},
    );
  }

  Future<void> logRecipeShare({required String recipeId, required String medium}) {
    return _analytics.logEvent(
      name: 'recipe_share',
      parameters: {
        'recipe_id': recipeId,
        'medium': medium,
      },
    );
  }

  Future<void> logSubmissionStart({required String platform}) {
    return _analytics.logEvent(
      name: 'submission_start',
      parameters: {'platform': platform},
    );
  }

  Future<void> logSubmissionComplete({required String status}) {
    return _analytics.logEvent(
      name: 'submission_complete',
      parameters: {'status': status},
    );
  }
}
