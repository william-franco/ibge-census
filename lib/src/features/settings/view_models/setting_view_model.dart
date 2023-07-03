// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:ibge_census/src/features/settings/repositories/setting_repository.dart';

abstract base class SettingViewModel extends ValueNotifier<bool> {
  SettingViewModel() : super(false);

  Future<void> loadTheme();
  Future<void> changeTheme({required bool isDarkMode});
}

base class SettingViewModelImpl extends ValueNotifier<bool>
    implements SettingViewModel {
  final SettingRepository settingRepository;

  SettingViewModelImpl({
    required this.settingRepository,
  }) : super(false) {
    loadTheme();
  }

  @override
  Future<void> loadTheme() async {
    final isDarkMode = await settingRepository.readTheme();
    value = isDarkMode;
    _debug();
  }

  @override
  Future<void> changeTheme({required bool isDarkMode}) async {
    await settingRepository.updateTheme(isDarkTheme: isDarkMode);
    value = isDarkMode;
    _debug();
  }

  void _debug() {
    log('Dark theme: $value');
  }
}
