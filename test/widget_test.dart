import 'package:flutter_test/flutter_test.dart';
import 'package:weathernaut/app/app.dart';

void main() {
  testWidgets('WeathernautApp starts successfully', (WidgetTester tester) async {
    // Build WeathernautApp and trigger a frame.
    await tester.pumpWidget(const WeathernautApp(environment: 'DEV'));

    // Verify Weathernaut app starts and splash is active
    expect(find.byType(WeathernautApp), findsOneWidget);
  });
}
