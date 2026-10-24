import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:goodwork/main.dart';
import 'package:goodwork/widgets/job_card.dart';
import 'package:goodwork/widgets/job_detail_pane.dart';

void main() {
  group('Goodwork App Tests', () {
    testWidgets('App renders Goodwork header, tagline, and job list on phone viewport', (WidgetTester tester) async {
      // Set phone viewport
      tester.view.physicalSize = const Size(500, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const GoodworkApp());
      await tester.pumpAndSettle();

      // Check header branding
      expect(find.text('Goodwork'), findsOneWidget);
      expect(find.text('Find work that matters.'), findsOneWidget);

      // Check search bar
      expect(find.byType(TextField), findsOneWidget);

      // Check category chips visible on mobile
      expect(find.widgetWithText(FilterChip, 'All roles'), findsOneWidget);
      expect(find.widgetWithText(FilterChip, 'Climate'), findsOneWidget);
      expect(find.widgetWithText(FilterChip, 'Health'), findsOneWidget);

      // Check sample jobs presence
      expect(find.text('Climate Data Analyst'), findsOneWidget);
      expect(find.text('Terra Collective'), findsOneWidget);
    });

    testWidgets('Filter by category works correctly', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(500, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const GoodworkApp());
      await tester.pumpAndSettle();

      // Tap Health category filter chip
      await tester.tap(find.widgetWithText(FilterChip, 'Health'));
      await tester.pumpAndSettle();

      // Health role should be visible
      expect(find.text('Community Health Program Lead'), findsOneWidget);
      expect(find.text('Swasthya Foundation'), findsOneWidget);

      // Climate role should not be visible under Health
      expect(find.text('Climate Data Analyst'), findsNothing);
    });

    testWidgets('Search query filters jobs dynamically', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(500, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const GoodworkApp());
      await tester.pumpAndSettle();

      // Enter search term
      await tester.enterText(find.byType(TextField), 'Equal Access Labs');
      await tester.pumpAndSettle();

      // Matched role should appear
      expect(find.text('Accessibility Product Designer'), findsOneWidget);

      // Other roles should be excluded
      expect(find.text('Climate Data Analyst'), findsNothing);
    });

    testWidgets('Responsive Layout: Switches to Two-Pane on wide screens (>= 900px)', (WidgetTester tester) async {
      // Set desktop viewport >= 900px
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const GoodworkApp());
      await tester.pumpAndSettle();

      // Header should show SDG badge on wide screen
      expect(find.text('UN SDG Aligned Careers'), findsOneWidget);

      // All category chips should be rendered
      expect(find.widgetWithText(FilterChip, 'All roles'), findsOneWidget);
      expect(find.widgetWithText(FilterChip, 'Climate'), findsOneWidget);
      expect(find.widgetWithText(FilterChip, 'Health'), findsOneWidget);

      // Both list cards and right pane detail should exist simultaneously
      expect(find.byType(JobCard), findsWidgets);
      expect(find.byType(JobDetailPane), findsOneWidget);
      expect(find.text('IMPACT MISSION'), findsOneWidget);
      expect(find.text('Apply for this role'), findsOneWidget);
    });

    testWidgets('Apply button triggers employer modal dialog', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const GoodworkApp());
      await tester.pumpAndSettle();

      // Tap apply button in detail pane
      final applyButton = find.text('Apply for this role');
      await tester.ensureVisible(applyButton);
      await tester.tap(applyButton);
      await tester.pumpAndSettle();

      // Dialog should appear
      expect(find.text('Continue with Employer'), findsOneWidget);
      expect(find.text('Proceed to Apply'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      // Dismiss dialog
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.text('Continue with Employer'), findsNothing);
    });
  });
}
