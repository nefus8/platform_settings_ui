import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSwitchTileIos extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool value;
  final Icon? icon;
  final Function onChanged;
  final Color? activeColor;
  final Color? thumbColor;
  final Color? trackColor;


  const SettingsSwitchTileIos({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.value,
    this.subTitle = "",
    this.icon,
    this.activeColor,
    this.thumbColor,
    this.trackColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          dense: true,
          title: Text(title, textAlign: TextAlign.start,),
          leading: icon,
          trailing: CupertinoSwitch(
            onChanged: (bool value) {onChanged(value);},
            value: value,
            activeColor: activeColor,
            thumbColor: thumbColor,
            trackColor: trackColor,
          ),
        ),
        const Divider(indent: 50, height: 0,),
      ],
    );
  }
}
