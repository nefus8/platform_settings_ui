import 'package:flutter/material.dart';

class SettingsSliderTileAndroid extends StatefulWidget {
  String? title;
  Icon? leadingIcon;
  Icon? trailingIcon;
  Function onChanged;
  double value, max, min;
  Color? activeColor;
  int? division;

  SettingsSliderTileAndroid(
      {required this.onChanged,
      required this.value,
      this.title,
      this.leadingIcon,
      this.trailingIcon,
      this.max = 1,
      this.min = 0,
      this.activeColor,
      this.division,
      Key? key})
      : super(key: key);

  @override
  State<SettingsSliderTileAndroid> createState() =>
      _SettingsSliderTileAndroidState();
}

class _SettingsSliderTileAndroidState extends State<SettingsSliderTileAndroid> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: widget.title == null ? getSlider() : Text(widget.title!, style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light ? null : Colors.white),),
      subtitle: widget.title == null ? null : getSlider(),
      leading: widget.leadingIcon == null
          ? null
          : (widget.title == null
              ? widget.leadingIcon!
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.leadingIcon!,
                    widget.title == null
                        ? const SizedBox.shrink()
                        : const SizedBox(
                            height: 5,
                          )
                  ],
                )),
      dense: true,
      trailing: widget.trailingIcon == null
          ? null
          : (widget.title == null
              ? widget.trailingIcon!
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.trailingIcon!,
                    widget.title == null
                        ? const SizedBox.shrink()
                        : const SizedBox(
                            height: 5,
                          )
                  ],
                )),
    );
  }

  Slider getSlider() {
    return Slider(
      onChanged: (value) => widget.onChanged(value),
      value: widget.value,
      max: widget.max,
      min: widget.min,
      activeColor: widget.activeColor,
      divisions: widget.division,
    );
  }
}
