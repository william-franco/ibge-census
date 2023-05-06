// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:ibge_census/src/features/settings/view_models/setting_cubit.dart';

class ThemeListTileWidget extends StatelessWidget {
  const ThemeListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<SettingViewModel>().state;
    return ListTile(
      leading: const Icon(Icons.brightness_6_outlined),
      title: const Text('Tema escuro'),
      trailing: Switch(
        value: isDarkTheme,
        onChanged: (bool enabled) {
          context.read<SettingViewModel>().changeTheme(enabled);
        },
      ),
    );
  }
}
