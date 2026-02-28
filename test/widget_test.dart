import 'package:flutter_test/flutter_test.dart';
import 'package:swipecolor/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Just verify the app builds
    await tester.pumpWidget(const SwipeColorApp());
    expect(find.byType(SwipeColorApp), findsOneWidget);
  });
}
