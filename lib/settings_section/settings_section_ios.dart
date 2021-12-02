import 'package:flutter/material.dart';

@protected
class SettingsSectionIos extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const SettingsSectionIos({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
                  title!,
                  style: TextStyle(color: Colors.grey.shade600),
                )
              : const SizedBox.shrink(),
          title != null
              ? const SizedBox(
                  height: 4,
                )
              : const SizedBox.shrink(),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Material(
              color: Theme.of(context).brightness == Brightness.light ? Colors.white : Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
