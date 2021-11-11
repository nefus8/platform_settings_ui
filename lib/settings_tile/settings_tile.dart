import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_settings_ui/edits_types/edit_type_enum.dart';
import 'package:platform_settings_ui/edits_types/list_edit_tile.dart';
import 'package:platform_settings_ui/edits_types/list_edit_type_view.dart';
import 'package:platform_settings_ui/settings_tile/settings_tile_android.dart';
import 'package:platform_settings_ui/settings_tile/settings_tile_ios.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon? icon;
  final bool? showChevron;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final Function? onChanged;
  final EditType editType;
  final String androidDialogMessage;
  final ListEditTypeView? listEditTypeView;
  const SettingsTile({
    Key? key,
    required this.title,
    this.icon,
    this.subTitle = "",
    this.showChevron,
    this.onTap,
    this.editType = EditType.text,
    this.onEditingComplete,
    this.onChanged,
    this.androidDialogMessage = "",
    this.listEditTypeView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SettingsTileIos(
        editType: editType,
        title: title,
        icon: icon,
        showChevron: showChevron ?? true,
        subTitle: subTitle,
        onTap: onTap,
        onChanged: onChanged,
        key: key,
        onEditingComplete: onEditingComplete,
        listEditTypeView: listEditTypeView,
      );
    } else {
      return SettingsTileAndroid(
        editType: editType,
        title: title,
        icon: icon,
        showChevron: showChevron ?? false,
        subTitle: subTitle,
        onTap: onTap,
        onChanged: onChanged,
        key: key,
        onEditingComplete: onEditingComplete,
        androidDialogMessage: androidDialogMessage,
        listEditTypeView: listEditTypeView,
      );
    }
  }
}
