import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:viral_recipes_app/app/app.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('feed flow loads recipes and supports refresh', (tester) async {
    await app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.textContaining('Viral recipe'), findsWidgets);

    final refreshFinder = find.byTooltip('Refresh feed');
    expect(refreshFinder, findsOneWidget);
    await tester.tap(refreshFinder);
    await tester.pumpAndSettle();

    expect(find.textContaining('Viral recipe'), findsWidgets);
  });
}
