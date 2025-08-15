import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('Title and initial status displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    expect(find.text('Tic Tac Toe'), findsOneWidget);
    expect(find.byKey(const Key('status_text')), findsOneWidget);
    expect(find.textContaining("Player X"), findsOneWidget);
    expect(find.byKey(const Key('board_grid')), findsOneWidget);
  });

  testWidgets('Board interaction alternates players and reset clears the board',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Tap first cell -> X
    await tester.tap(find.byKey(const Key('cell_0')));
    await tester.pump();
    expect(find.text('X'), findsOneWidget);

    // Tap second cell -> O
    await tester.tap(find.byKey(const Key('cell_1')));
    await tester.pump();
    expect(find.text('O'), findsOneWidget);

    // Reset
    await tester.tap(find.byKey(const Key('reset_button')));
    await tester.pump();

    // After reset, no X or O on board
    expect(find.text('X'), findsNothing);
    expect(find.text('O'), findsNothing);

    // Status back to Player X
    expect(find.byKey(const Key('status_text')), findsOneWidget);
    expect(find.textContaining("Player X"), findsOneWidget);
  });
}
