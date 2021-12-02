import 'package:flutter/material.dart';

@protected
class SettingsSectionAndroid extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const SettingsSectionAndroid({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 60.0, top: 10.0),
                  child: Text(
                    title!.toUpperCase(),
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        title != null
            ? const SizedBox(
                height: 4,
              )
            : const SizedBox.shrink(),
        Material(
          color: const Color(0x00FFFFFF),
          borderRadius: BorderRadius.circular(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
              ..add(const Divider(
                height: 10,
                thickness: 1,
              )),
          ),
        ),
      ],
    );
  }
}
