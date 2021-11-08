import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_settings_ui/settings_section/settings_section.dart';

class SettingsList extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  final bool shrinkWrap;
  final List<SettingsSection> children;
  SettingsList({
    Key? key,
    required this.children,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFEFEFF4),
        child: CupertinoScrollbar(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            shrinkWrap: shrinkWrap,
            children: children,
          ),
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Scrollbar(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            shrinkWrap: shrinkWrap,
            children: children,
          ),
        ),
      );
    }
  }
}
