// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:ibge_census/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:ibge_census/src/features/persons/views/person_view.dart';
import 'package:ibge_census/src/features/settings/views/setting_view.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  final listOfWidgets = [
    const PersonView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BottomViewModel>();
    return Scaffold(
      body: listOfWidgets.elementAt(viewModel.value.indexTab),
      bottomNavigationBar: NavigationBar(
        selectedIndex: viewModel.value.indexTab,
        animationDuration: const Duration(milliseconds: 600),
        onDestinationSelected: (int index) {
          context.read<BottomViewModel>().changeIndexBottom(index: index);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Nomes',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
