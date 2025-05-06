import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/main.dart'
    as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('로그인 후 HomePage로 이동하는 흐름 테스트', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, 'test');
    await tester.enterText(find.byType(TextField).last, 'test123!');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Hello !'), findsOneWidget);
  });
}
