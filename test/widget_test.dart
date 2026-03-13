import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_general_template/src/main_activity.dart';
import 'package:flutter_general_template/src/service/locator/locator.dart';
import 'package:flutter_general_template/src/modules/home/view/home_view.dart';
import 'package:flutter_general_template/src/theme/app_colors.dart';

void main() {
  setUpAll(() {
    // Setup dependency injection before any widget tests run
    setupLocator();
  });

  testWidgets('App initializes and HomeView is properly displayed', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MainActivity());

    // Allow ScreenUtil to settle and animations to finish
    await tester.pumpAndSettle();

    // Verify that the HomeView is initially mounted since it's the initialRoute.
    expect(find.byType(HomeView), findsOneWidget);

    // Verify template title is found in the initial header
    expect(find.text('Flutter General Template'), findsOneWidget);
  });
}
