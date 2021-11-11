import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:more_widgets/more_widgets.dart';

class TextEditType {
  static void showEditingText({
    required BuildContext context,
    required String title,
    String androidDialogMessage = "",
    String? subTitle,
    VoidCallback? onEditingComplete,
    Function? onChanged,
  }) {
    if (Platform.isIOS) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => _TextEditType(
                    title: title,
                    onChanged: onChanged,
                    onEditingComplete: onEditingComplete,
                    subTitle: subTitle,
                  )));
    } else {
      Dialogs.textInputDialog(
        context: context,
        title: title,
        message: androidDialogMessage,
        placeHolder: subTitle,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onPressed: () {},
      );
    }
  }
}

class _TextEditType extends StatefulWidget {
  final String title;
  final VoidCallback? onEditingComplete;
  String? subTitle;
  Function? onChanged;

  _TextEditType({
    Key? key,
    required this.title,
    this.onEditingComplete,
    this.onChanged,
    this.subTitle,
  }) : super(key: key);

  @override
  State<_TextEditType> createState() => _TextEditTypeState();
}

class _TextEditTypeState extends State<_TextEditType> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: const Color(0xFFEFEFF4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: CupertinoTextField(
          controller: _controller,
          clearButtonMode: OverlayVisibilityMode.never,
          autocorrect: true,
          onEditingComplete: widget.onEditingComplete,
          onChanged: (value) {
            setState(() {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            });
          },
          placeholder: widget.subTitle,
          suffix: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.clear_rounded,
              size: 20,
              color: _controller.text.trim().isNotEmpty
                  ? null
                  : Colors.transparent,
            ),
            onPressed: () => setState(() {
              _controller.text = "";
            }),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
