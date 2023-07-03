// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:ibge_census/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:ibge_census/src/features/persons/repositories/person_repository.dart';
import 'package:ibge_census/src/features/persons/view_models/person_view_model.dart';
import 'package:ibge_census/src/features/settings/repositories/setting_repository.dart';
import 'package:ibge_census/src/features/settings/view_models/setting_view_model.dart';
import 'package:ibge_census/src/services/http_service.dart';
import 'package:ibge_census/src/services/storage_service.dart';

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
        // Services
        Provider<HttpService>(
          create: (context) => HttpServiceImpl(),
        ),
        Provider<StorageService>(
          create: (context) => StorageServiceImpl(),
        ),
        // Repositories
        Provider<PersonRepository>(
          create: (context) => PersonRepositoryImpl(
            httpService: context.read<HttpService>(),
          ),
        ),
        Provider<SettingRepository>(
          create: (context) => SettingRepositoryImpl(
            storageService: context.read<StorageService>(),
          ),
        ),
        // ViewModels
        ChangeNotifierProvider<BottomViewModel>(
          create: (context) => BottomViewModelImpl(),
        ),
        ChangeNotifierProvider<PersonViewModel>(
          create: (context) => PersonViewModelImpl(
            personRepository: context.read<PersonRepository>(),
          ),
        ),
        ChangeNotifierProvider<SettingViewModel>(
          create: (context) => SettingViewModelImpl(
            settingRepository: context.read<SettingRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
