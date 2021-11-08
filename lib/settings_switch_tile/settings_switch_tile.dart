import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_settings_ui/settings_switch_tile/settings_switch_tile_android.dart';
import 'package:platform_settings_ui/settings_switch_tile/settings_switch_tile_ios.dart';

class SettingsSwitchTile extends StatefulWidget {
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
  State<SettingsSwitchTile> createState() => _SettingsSwitchTileState();
}

class _SettingsSwitchTileState extends State<SettingsSwitchTile> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SettingsSwitchTileIos(
        title: widget.title,
        icon: widget.icon,
        onChanged: widget.onChanged,
        value: widget.value,
        trackColor: widget.trackColor,
        thumbColor: widget.thumbColor,
        activeColor: widget.activeColor,
      );
    } else {
      return SettingsSwitchTileAndroid(
        title: widget.title,
        icon: widget.icon,
        onChanged: widget.onChanged,
        value: widget.value,
        trackColor: MaterialStateProperty.all(widget.trackColor),
        thumbColor: MaterialStateProperty.all(widget.thumbColor),
        activeColor: widget.activeColor,
      );
    }
  }
}
