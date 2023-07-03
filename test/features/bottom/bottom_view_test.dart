// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:ibge_census/src/dependency_injector/dependency_injector.dart';
import 'package:ibge_census/src/features/bottom/views/bottom_view.dart';
import 'package:ibge_census/src/features/persons/views/person_view.dart';
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
      final settingView = find.byType(SettingView);
      final settingsIcon = find.byIcon(Icons.settings_outlined);

      await tester.pumpWidget(widget);

      expect(personView, findsOneWidget);
      expect(settingView, findsNothing);

      await tester.tap(settingsIcon);
      await tester.pumpAndSettle();

      expect(personView, findsNothing);
      expect(settingView, findsOneWidget);
    });
  });
}
