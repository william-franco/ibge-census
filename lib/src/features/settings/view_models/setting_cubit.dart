import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibge_census/src/features/settings/repositories/setting_repository.dart';

class SettingViewModel extends Cubit<bool> {
  final SettingRepository settingRepository;

  SettingViewModel({required this.settingRepository}) : super(false) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDarkMode = await settingRepository.readTheme();
    emit(isDarkMode);
    _debug();
  }

  Future<void> changeTheme(bool isDarkMode) async {
    await settingRepository.updateTheme(isDarkTheme: isDarkMode);
    emit(isDarkMode);
    _debug();
  }

  void _debug() {
    log('Dark theme: $state');
  }
}
