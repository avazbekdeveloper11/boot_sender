// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:phone_data_sender/src/app.dart';
//
// import 'package:phone_data_sender/src/core/constants/constants.dart';
//
// void main() {
//   testWidgets('Flutter Widget Test', (tester) async {
//     await tester.pumpWidget(const MainApp());
//     final button = find.byKey(Constants.bottomNavigatorKey);
//     expect(button, findsOneWidget);
//     debugPrint('Reverse Text');
//     await tester.tap(button);
//     await tester.pump();
//     expect(find.text('sveD rettulF'), findsNothing);
//     debugPrint('sveD rettulF');
//   });
//
//   testWidgets('Counter increments smoke test', (tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MainApp());
//
//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();
//
//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
