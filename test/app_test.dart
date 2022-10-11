import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_timer/app.dart';
import 'package:flutter_timer/features/timer/presentation/view/timer_page.dart';

void main() {
  group('App', () {
    testWidgets('renders TimerPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(TimerPage), findsOneWidget);
    });
  });
}
