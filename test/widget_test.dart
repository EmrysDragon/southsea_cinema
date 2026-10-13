import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';

void main() {
  group('Southsea Cinema App widget tests', () {
    testWidgets('App displays Home as loadup view',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(HomeView), findsOneWidget);
    });

    testWidgets('Displays movie cards on home', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text('Dune: Part Two (2024)'), findsOneWidget);
      expect(
          find.text(
              'The war for Arrakis begins. Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.'),
          findsOneWidget);
      expect(find.text('(Run time: 2h 46 mins)'), findsOneWidget);
      expect(find.text('Book Tickets'), findsAny);
      expect(
          find.text(
              'Screening Time: Wednesday, 30th September 2026, 18:00 - 20:46'),
          findsOneWidget);
      expect(find.text('Book Now'), findsAny);
    });

    testWidgets('Booking button shows the number of tickets ordered',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(find.text('Book Now').first);
      await tester.pumpAndSettle();

      expect(find.text('Tickets (£12.50 each)'), findsOneWidget);

      await tester.ensureVisible(find.text('Add to order'));
      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(find.text('1 ticket ordered'), findsOneWidget);
    });
  });
}
