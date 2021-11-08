import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_settings_ui/settings_tile/settings_switch_tile_android.dart';
import 'package:platform_settings_ui/settings_tile/settings_switch_tile_ios.dart';
import 'package:platform_settings_ui/settings_tile/settings_tile_android.dart';
import 'package:platform_settings_ui/settings_tile/settings_tile_ios.dart';

class SettingsSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final Icon? icon;
  final Function onChanged;
  final Color? activeColor;
  final Color? thumbColor;
  final Color? trackColor;

  const SettingsSwitchTile({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.value,
    this.icon,
    this.activeColor,
    this.trackColor,
    this.thumbColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SettingsSwitchTileIos(
        title: title,
        icon: icon,
        onChanged: onChanged,
        value: value,
        trackColor: trackColor,
        thumbColor: thumbColor,
        activeColor: activeColor,
      );
    } else {
      return SettingsSwitchTileAndroid(
        title: title,
        icon: icon,
        onChanged: onChanged,
        value: value,
        trackColor: MaterialStateProperty.all(trackColor),
        thumbColor: MaterialStateProperty.all(thumbColor),
        activeColor: activeColor,
      );
    }
  }
}
