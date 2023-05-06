// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:ibge_census/src/dependency_injector/dependency_injector.dart';
import 'package:ibge_census/src/features/bottom/views/bottom_view.dart';
import 'package:ibge_census/src/features/person/views/person_view.dart';
import 'package:ibge_census/src/features/settings/views/setting_view.dart';

void main() {
  group('BottomView', () {
    testWidgets('BottomView should change tabs', (WidgetTester tester) async {
      const widget = MaterialApp(
        home: DependencyInjector(
          child: BottomView(),
        ),
      );

      final personView = find.byType(PersonView);
      final itemsView = find.byType(PersonView);
      final settingView = find.byType(SettingView);
      final listIcon = find.byIcon(Icons.list_alt_outlined);
      final settingsIcon = find.byIcon(Icons.settings_outlined);

      await tester.pumpWidget(widget);

      expect(personView, findsOneWidget);
      expect(itemsView, findsNothing);
      expect(settingView, findsNothing);

      await tester.tap(listIcon);
      await tester.pumpAndSettle();

      expect(personView, findsNothing);
      expect(itemsView, findsOneWidget);
      expect(settingView, findsNothing);

      await tester.tap(settingsIcon);
      await tester.pumpAndSettle();

      expect(personView, findsNothing);
      expect(itemsView, findsNothing);
      expect(settingView, findsOneWidget);
    });
  });
}
