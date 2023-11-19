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

class DependencyInjector extends StatefulWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  State<DependencyInjector> createState() => _DependencyInjectorState();
}

class _DependencyInjectorState extends State<DependencyInjector> {
  late HttpService httpService;
  late StorageService storageService;
  late PersonRepository personRepository;
  late SettingRepository settingRepository;

  @override
  void initState() {
    super.initState();
    httpService = HttpServiceImpl();
    storageService = StorageServiceImpl();
    personRepository = PersonRepositoryImpl(httpService: httpService);
    settingRepository = SettingRepositoryImpl(storageService: storageService);
  }

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
            personRepository: personRepository,
          ),
        ),
        ChangeNotifierProvider<SettingViewModel>(
          create: (context) => SettingViewModelImpl(
            settingRepository: settingRepository,
          ),
        ),
      ],
      child: widget.child,
    );
  }
}
