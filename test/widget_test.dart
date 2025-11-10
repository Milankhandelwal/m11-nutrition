// This is a basic Flutter widget test for NutriGenie app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import the screens directly to avoid timer issues
import 'package:nutri_genie_app/src/presentation/screens/home_screen.dart';
import 'package:nutri_genie_app/src/presentation/screens/recipes_screen.dart';
import 'package:nutri_genie_app/src/presentation/screens/progress_screen.dart';
import 'package:nutri_genie_app/src/presentation/screens/profile_screen.dart';

void main() {
  testWidgets('Home screen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    // Verify that the home screen is displayed.
    expect(find.text('NutriGenie'), findsOneWidget);
    expect(find.text('Good Morning,'), findsOneWidget);
  });

  testWidgets('Recipes screen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: RecipesScreen(),
      ),
    );

    // Verify that the recipes screen is displayed.
    expect(find.text('Recipes'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('Progress screen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: ProgressScreen(),
      ),
    );

    // Verify that the progress screen is displayed.
    expect(find.text('Progress'), findsOneWidget);
    expect(find.text('Weight Trend'), findsOneWidget);
  });

  testWidgets('Profile screen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfileScreen(),
      ),
    );

    // Verify that the profile screen is displayed.
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Profile Details'), findsOneWidget);
  });
}