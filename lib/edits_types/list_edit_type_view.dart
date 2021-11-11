import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_settings_ui/edits_types/list_edit_tile.dart';
import 'package:platform_settings_ui/edits_types/list_edit_tile_ios.dart';
import 'package:platform_settings_ui/settings_list/settings_list.dart';
import 'package:platform_settings_ui/settings_section/settings_section.dart';

import 'list_edit_tile_android.dart';

class ListEditTypeView<T> extends StatefulWidget {
  final String title;
  List<ListEditTile> children;
  T groupValue;
  Function? onChanged;
  ListEditTypeView(
      {required this.title,
      required this.children,
      required this.groupValue,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  State<ListEditTypeView<T>> createState() => _ListEditTypeViewState<T>();
}

class _ListEditTypeViewState<T> extends State<ListEditTypeView<T>> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Platform.isIOS ? const Color(0xFFEFEFF4) : null,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SettingsList(
        children: [
          SettingsSection(
            children: getChildren(),
          )
        ],
      ),
    );
  }

  void onChanged(T value) {
    setState(() {
      widget.groupValue = value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  List<Widget> getChildren() {
    List<Widget> children = [];

    if (Platform.isIOS) {
      for (ListEditTile x in widget.children) {
        children.add(ListEditTileIos<T>(
            title: x.title,
            value: x.value,
            groupValue: widget.groupValue,
            onChanged: (value) => onChanged(value!)));
      }
    } else {
      for (ListEditTile x in widget.children) {
        children.add(ListEditTileAndroid<T>(
            title: x.title,
            value: x.value,
            groupValue: widget.groupValue,
            onChanged: (value) => onChanged(value!)));
      }
    }
    return children;
  }
}
