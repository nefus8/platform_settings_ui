import 'package:flutter/material.dart';

class SettingsSwitchTileAndroid extends StatefulWidget {
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
  State<SettingsSwitchTileAndroid> createState() => _SettingsSwitchTileAndroidState();
}

class _SettingsSwitchTileAndroidState extends State<SettingsSwitchTileAndroid> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(widget.title, textAlign: TextAlign.start,),
      leading: widget.icon,
      trailing: Switch(
        onChanged: (bool value) {widget.onChanged(value);},
        value: widget.value,
        activeColor: widget.activeColor,
        thumbColor: widget.thumbColor,
        trackColor: widget.trackColor,
      ),
    );
  }
}
