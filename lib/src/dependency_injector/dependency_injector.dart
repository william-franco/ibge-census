// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:ibge_census/src/dependency_injector/locator_injector.dart';
import 'package:ibge_census/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:ibge_census/src/features/persons/repositories/person_repository.dart';
import 'package:ibge_census/src/features/persons/view_models/person_view_model.dart';
import 'package:ibge_census/src/features/settings/repositories/setting_repository.dart';
import 'package:ibge_census/src/features/settings/view_models/setting_view_model.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ViewModels
        ChangeNotifierProvider<BottomViewModel>(
          create: (context) => BottomViewModelImpl(),
        ),
        ChangeNotifierProvider<PersonViewModel>(
          create: (context) => PersonViewModelImpl(
            personRepository: locator<PersonRepository>(),
          ),
        ),
        ChangeNotifierProvider<SettingViewModel>(
          create: (context) => SettingViewModelImpl(
            settingRepository: locator<SettingRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
