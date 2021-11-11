import 'dart:io';

import 'package:flutter/material.dart';

class ListEditTile<T> {
  final Widget title;
  final T value;

  ListEditTile({
    required this.title,
    required this.value,
  });
}
