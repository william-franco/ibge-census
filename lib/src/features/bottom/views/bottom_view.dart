import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibge_census/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:ibge_census/src/features/person/views/person_view.dart';
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
    final state = context.watch<BottomViewModel>().state;
    return Scaffold(
      body: listOfWidgets.elementAt(state),
      bottomNavigationBar: NavigationBar(
        selectedIndex: state,
        animationDuration: const Duration(milliseconds: 600),
        onDestinationSelected: (int index) {
          context.read<BottomViewModel>().changeIndexBottom(index);
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
