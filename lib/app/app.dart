import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:viral_recipes_app/shared/design_system/app_theme.dart';

import 'package:viral_recipes_app/app/providers.dart';
import 'package:viral_recipes_app/app/router.dart';
import 'package:viral_recipes_app/app/telemetry/remote_config_bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseAnalytics? analytics;
  FirebaseRemoteConfig? remoteConfig;

  try {
    await Firebase.initializeApp();
    analytics = FirebaseAnalytics.instance;
    remoteConfig = FirebaseRemoteConfig.instance;
    await initializeRemoteConfig(remoteConfig);
  } catch (error, stackTrace) {
    debugPrint('Firebase initialization failed: $error');
    debugPrintStack(stackTrace: stackTrace);
  }

  runApp(
    ProviderScope(
      overrides: [
        firebaseAnalyticsProvider.overrideWithValue(analytics),
        remoteConfigProvider.overrideWithValue(remoteConfig),
      ],
      child: const ViralRecipesApp(),
    ),
  );
}

class ViralRecipesApp extends ConsumerWidget {
  const ViralRecipesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Viral Recipes',
      theme: buildLightTheme(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
