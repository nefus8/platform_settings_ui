import 'package:flutter/material.dart';

class SettingsTileIos extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool showChevron;
  final Icon? icon;
  final VoidCallback? onTap;

  const SettingsTileIos({
    Key? key,
    required this.title,
    this.onTap,
    this.subTitle = "",
    this.showChevron = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: onTap,
          title: Text(title, textAlign: TextAlign.start),
          leading: icon,
          dense: true,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(subTitle, style: TextStyle(color: Colors.grey.shade500, overflow: TextOverflow.ellipsis),),
              showChevron ? const Icon(Icons.chevron_right) : const SizedBox.shrink(),
            ],
          ),
        ),
        const Divider(indent: 50, height: 0,),
      ],
    );
  }
}
