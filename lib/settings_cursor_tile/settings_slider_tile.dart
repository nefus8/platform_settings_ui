import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_settings_ui/settings_cursor_tile/settings_slider_tile_android.dart';
import 'package:platform_settings_ui/settings_cursor_tile/settings_slider_tile_ios.dart';

class SettingsSliderTile extends StatefulWidget {
  String? title;
  Icon? leadingIcon;
  Icon? trailingIcon;
  Function onChanged;
  double value, max, min;
  Color? activeColor;
  int? division;
  bool titleAndroidOnly, trailingIconIosOnly;

  SettingsSliderTile(
      {required this.onChanged,
      required this.value,
      this.title,
      this.leadingIcon,
      this.trailingIcon,
      this.max = 1,
      this.min = 0,
      this.activeColor,
      this.division,
      this.titleAndroidOnly = true,
      this.trailingIconIosOnly = true,
      Key? key})
      : super(key: key);

  @override
  State<SettingsSliderTile> createState() => _SettingsSliderTileState();
}

class _SettingsSliderTileState extends State<SettingsSliderTile> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SettingsSliderTileIos(
        value: widget.value,
        onChanged: widget.onChanged,
        activeColor: widget.activeColor,
        max: widget.max,
        title: widget.titleAndroidOnly ? null : widget.title,
        division: widget.division,
        key: widget.key,
        leadingIcon: widget.leadingIcon,
        min: widget.min,
        trailingIcon: widget.trailingIcon,
      );
    } else {
      return SettingsSliderTileAndroid(
        value: widget.value,
        onChanged: widget.onChanged,
        activeColor: widget.activeColor,
        max: widget.max,
        title: widget.title,
        division: widget.division,
        key: widget.key,
        leadingIcon: widget.leadingIcon,
        min: widget.min,
        trailingIcon: widget.trailingIconIosOnly ? null : widget.trailingIcon,
      );
    }
  }
}
