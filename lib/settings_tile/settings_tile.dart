import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_settings_ui/settings_tile/settings_tile_android.dart';
import 'package:platform_settings_ui/settings_tile/settings_tile_ios.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon? icon;
  final bool? showChevron;
  final VoidCallback? onTap;
  const SettingsTile({
    Key? key,
    required this.title,
    this.icon,
    this.subTitle = "",
    this.showChevron,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SettingsTileIos(
        title: title,
        icon: icon,
        showChevron: showChevron ?? true,
        subTitle: subTitle,
        onTap: onTap,
      );
    } else {
      return SettingsTileAndroid(
        title: title,
        icon: icon,
        showChevron: showChevron ?? false,
        subTitle: subTitle,
        onTap: onTap,
      );
    }
  }
}
