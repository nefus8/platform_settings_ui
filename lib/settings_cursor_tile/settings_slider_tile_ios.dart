import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSliderTileIos extends StatefulWidget {
  String? title;
  Icon? leadingIcon;
  Icon? trailingIcon;
  Function onChanged;
  double value, max, min;
  Color? activeColor;
  int? division;

  SettingsSliderTileIos({
    required this.onChanged,
    required this.value,
    this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.max = 1,
    this.min = 0,
    this.activeColor,
    this.division,
    Key? key
  }) : super(key: key);

  @override
  State<SettingsSliderTileIos> createState() => _SettingsSliderTileIosState();
}

class _SettingsSliderTileIosState extends State<SettingsSliderTileIos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: widget.title == null ? getSlider() : Text(widget.title!),
          subtitle: widget.title == null ? null : getSlider(),
          leading: widget.leadingIcon == null ? null : (widget.title == null ? widget.leadingIcon! : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [widget.leadingIcon!, widget.title == null ? const SizedBox.shrink() : const SizedBox(height: 5,)],
          )),
          dense: true,
          trailing: widget.trailingIcon == null ? null : (widget.title == null ? widget.trailingIcon! : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [widget.trailingIcon!, widget.title == null ? const SizedBox.shrink() : const SizedBox(height: 5,)],
          )),
        ),
        const Divider(indent: 50, height: 0,),
      ],
    );
  }

  CupertinoSlider getSlider() {
    return CupertinoSlider(
      onChanged: (value) => widget.onChanged(value),
      value: widget.value,
      max: widget.max,
      min: widget.min,
      activeColor: widget.activeColor,
      divisions: widget.division,
    );
  }
}
