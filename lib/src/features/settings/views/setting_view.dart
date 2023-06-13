// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ibge_census/src/common_widgets/common_padding.dart';
import 'package:ibge_census/src/features/settings/widgets/info_list_tile_widget.dart';
import 'package:ibge_census/src/features/settings/widgets/theme_list_tile_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Configurações'),
      ),
      body: CommonPadding(
        child: ListView(
          children: const <Widget>[
            ThemeListTileWidget(),
            InfoListTileWidget(),
          ],
        ),
      ),
    );
  }
}
