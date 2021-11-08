import 'package:flutter/material.dart';

class SettingsTileAndroid extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool showChevron;
  final Icon? icon;
  final VoidCallback? onTap;

  const SettingsTileAndroid({
    Key? key,
    required this.title,
    this.onTap,
    this.subTitle = "",
    this.showChevron = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      title: Text(title, textAlign: TextAlign.start,),
      leading: SizedBox(
        height: double.infinity,
          child: icon
      ),
      subtitle: Text(subTitle, style: TextStyle(color: Colors.grey.shade500, overflow: TextOverflow.ellipsis),),
      trailing: showChevron ? const Icon(Icons.chevron_right) : const SizedBox.shrink(),
    );
  }
}
