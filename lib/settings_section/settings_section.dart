import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_settings_ui/settings_section/settings_section_android.dart';
import 'package:platform_settings_ui/settings_section/settings_section_ios.dart';

class SettingsSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const SettingsSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SettingsSectionIos(
        title: title,
        children: children,
      );
    } else {
      return SettingsSectionAndroid(
        title: title,
        children: children,
      );
    }
  }
}
