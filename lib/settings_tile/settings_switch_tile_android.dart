import 'package:flutter/material.dart';

class SettingsSwitchTileAndroid extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool value;
  final Icon? icon;
  final Function onChanged;
  final Color? activeColor;
  final MaterialStateProperty<Color?>? thumbColor;
  final MaterialStateProperty<Color?>? trackColor;

  const SettingsSwitchTileAndroid({
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
    return ListTile(
      dense: true,
      title: Text(title, textAlign: TextAlign.start,),
      leading: icon,
      trailing: Switch(
        onChanged: (bool value) {onChanged(value);},
        value: value,
        activeColor: activeColor,
        thumbColor: thumbColor,
        trackColor: trackColor,
      ),
    );
  }
}
