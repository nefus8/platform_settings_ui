import 'package:flutter/material.dart';

class ListEditTileIos<T> extends StatefulWidget {
  final Widget title;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  const ListEditTileIos({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<ListEditTileIos<T>> createState() => _ListEditTileIosState<T>();
}

class _ListEditTileIosState<T> extends State<ListEditTileIos<T>> {
  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.value == widget.groupValue;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () => setState(() => widget.onChanged(widget.value)),
          title: widget.title,
          leading: isSelected
              ? const Icon(Icons.check, size: 20, color: Colors.lightBlue)
              : const Icon(Icons.check, size: 20, color: Colors.transparent),
          dense: true,
        ),
        const Divider(
          indent: 50,
          height: 0,
        ),
      ],
    );
  }
}
