import 'package:flutter_test/flutter_test.dart';
import 'package:mini_market/main.dart';

void main() {
  testWidgets('Mini market app loads the home page', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Mini Market'), findsOneWidget);
    expect(find.text('Phone X'), findsOneWidget);
  });
}
