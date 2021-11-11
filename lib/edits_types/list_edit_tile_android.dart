import 'package:flutter/material.dart';

class ListEditTileAndroid<T> extends StatelessWidget {
  final Widget title;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  const ListEditTileAndroid({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return ListTile(
      onTap: () => onChanged(value),
      title: title,
      leading: isSelected
          ? const Icon(Icons.check, size: 20, color: Colors.lightBlue)
          : const Icon(Icons.check, color: Colors.transparent),
      dense: true,
    );
  }
}
