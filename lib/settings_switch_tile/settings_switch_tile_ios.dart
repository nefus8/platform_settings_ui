import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSwitchTileIos extends StatefulWidget {
  final String title;
  final String subTitle;
  final bool value;
  final Icon? icon;
  final Function onChanged;
  final Color? activeColor;
  final Color? thumbColor;
  final Color? trackColor;

  const SettingsSwitchTileIos(
      {Key? key,
      required this.title,
      required this.onChanged,
      required this.value,
      this.subTitle = "",
      this.icon,
      this.activeColor,
      this.thumbColor,
      this.trackColor})
      : super(key: key);

  @override
  State<SettingsSwitchTileIos> createState() => _SettingsSwitchTileIosState();
}

class _SettingsSwitchTileIosState extends State<SettingsSwitchTileIos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          dense: true,
          title: Text(
            widget.title,
            textAlign: TextAlign.start, style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light ? null : Colors.white)
          ),
          leading: widget.icon,
          trailing: CupertinoSwitch(
            onChanged: (bool value) {
              widget.onChanged(value);
            },
            value: widget.value,
            activeColor: widget.activeColor,
            thumbColor: widget.thumbColor,
            trackColor: widget.trackColor,
          ),
        ),
        const Divider(
          indent: 50,
          height: 0,
        ),
      ],
    );
  }
}
