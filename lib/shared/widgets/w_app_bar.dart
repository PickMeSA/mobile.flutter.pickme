import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

PreferredSizeWidget getAppBar({
Widget? leading,
Widget? title,
List<Widget>? actions,
bool? centerTitle = false,
}){
  return AppBar(
    leading: leading,
    title: title,
    actions: actions,
    backgroundColor: whiteColor,
    centerTitle: centerTitle,
    titleSpacing: 0,
    toolbarHeight: 110,

  );
}