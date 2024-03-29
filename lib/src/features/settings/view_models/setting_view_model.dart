// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:ibge_census/src/features/settings/models/setting_model.dart';
import 'package:ibge_census/src/features/settings/repositories/setting_repository.dart';

abstract base class SettingViewModel extends ValueNotifier<SettingModel> {
  SettingViewModel() : super(SettingModel());

  Future<void> loadTheme();
  Future<void> changeTheme({required bool isDarkTheme});
}

base class SettingViewModelImpl extends ValueNotifier<SettingModel>
    implements SettingViewModel {
  final SettingRepository settingRepository;

  SettingViewModelImpl({
    required this.settingRepository,
  }) : super(SettingModel()) {
    loadTheme();
  }

  @override
  Future<void> loadTheme() async {
    value.isDarkTheme = await settingRepository.readTheme();
    _debug();
  }

  @override
  Future<void> changeTheme({required bool isDarkTheme}) async {
    value.isDarkTheme = isDarkTheme;
    await settingRepository.updateTheme(isDarkTheme: isDarkTheme);
    _debug();
  }

  void _debug() {
    log('Dark theme: ${value.isDarkTheme}');
  }
}
