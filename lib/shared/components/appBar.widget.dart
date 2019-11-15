import 'package:flutter/material.dart';

class AppBarFactory {
  static const appBarHeight = Size.fromHeight(50.0);

  static Widget build({String title}) {
    return PreferredSize(
      preferredSize: appBarHeight,
      child: AppBar(
        title: Text(title),
      ),
    );
  }
}
