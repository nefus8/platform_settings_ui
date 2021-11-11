import 'package:flutter/material.dart';
import 'package:platform_settings_ui/edits_types/edit_type_enum.dart';
import 'package:platform_settings_ui/edits_types/list_edit_tile.dart';
import 'package:platform_settings_ui/edits_types/list_edit_type_view.dart';
import 'package:platform_settings_ui/edits_types/text_edit_type.dart';

class SettingsTileIos extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool showChevron;
  final Icon? icon;
  final VoidCallback? onTap;
  final EditType editType;
  final Function? onChanged;
  final VoidCallback? onEditingComplete;
  final ListEditTypeView? listEditTypeView;

  const SettingsTileIos({
    Key? key,
    required this.title,
    required this.editType,
    this.onTap,
    this.subTitle = "",
    this.showChevron = true,
    this.icon,
    this.onChanged,
    this.onEditingComplete,
    this.listEditTypeView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: editType == EditType.uneditable ? null : () => getFn(context),
          title: Text(title, textAlign: TextAlign.start),
          leading: icon,
          dense: true,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                    color: Colors.grey.shade500,
                    overflow: TextOverflow.ellipsis),
              ),
              showChevron
                  ? const Icon(Icons.chevron_right)
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        const Divider(
          indent: 50,
          height: 0,
        ),
      ],
    );
  }

  void getFn(BuildContext context) {
    switch (editType) {
      case EditType.text:
        TextEditType.showEditingText(
          context: context,
          title: title,
          onChanged: onChanged == null ? null : (value) => onChanged!(value),
          onEditingComplete: onEditingComplete,
          subTitle: subTitle,
        );
        break;
      case EditType.list:
        try {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => listEditTypeView!));
        } catch (e) {
          throw Exception(
              "A ListEditTypeView is required if using EditType.list...\n$e");
        }
        break;
      case EditType.custom:
        try {
          onTap!();
        } catch (error) {
          throw Exception(
              "package: platform_settings_ui\tonTap VoidCallback must not be null when EditType is custom...\n$error");
        }
        break;
      case EditType.uneditable:
        break; // Do nothing;
    }
  }
}
