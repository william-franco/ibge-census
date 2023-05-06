import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibge_census/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:ibge_census/src/features/person/repositories/person_repository.dart';
import 'package:ibge_census/src/features/person/view_models/person_view_model.dart';
import 'package:ibge_census/src/features/settings/repositories/setting_repository.dart';
import 'package:ibge_census/src/features/settings/view_models/setting_cubit.dart';
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
    return MultiRepositoryProvider(
      providers: [
        // Services
        RepositoryProvider(
          create: (context) => HttpService(),
        ),
        RepositoryProvider(
          create: (context) => StorageService(),
        ),
        // Repositories
        RepositoryProvider(
          create: (context) => PersonRepository(
            httpService: context.read<HttpService>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => SettingRepository(
            storageService: context.read<StorageService>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // ViewModels
          BlocProvider(
            create: (context) => BottomViewModel(),
          ),
          BlocProvider(
            create: (context) => PersonViewModel(
              personRepository: context.read<PersonRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => SettingViewModel(
              settingRepository: context.read<SettingRepository>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
