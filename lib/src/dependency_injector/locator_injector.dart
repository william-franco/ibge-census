// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:ibge_census/src/features/persons/repositories/person_repository.dart';
import 'package:ibge_census/src/features/settings/repositories/setting_repository.dart';
import 'package:ibge_census/src/services/http_service.dart';
import 'package:ibge_census/src/services/storage_service.dart';

final locator = GetIt.instance;

void locatorInjector() {
  startModuleHttp();
  startModulePerson();
  startModuleSettings();
}

void startModuleHttp() {
  // Services
  locator.registerFactory<HttpService>(
    () => HttpServiceImpl(),
  );
}

void startModulePerson() {
  // Repositories
  locator.registerFactory<PersonRepository>(
    () => PersonRepositoryImpl(
      httpService: locator<HttpService>(),
    ),
  );
}

void startModuleSettings() {
  // Services
  locator.registerFactory<StorageService>(
    () => StorageServiceImpl(),
  );
  // Repositories
  locator.registerFactory<SettingRepository>(
    () => SettingRepositoryImpl(
      storageService: locator<StorageService>(),
    ),
  );
}
