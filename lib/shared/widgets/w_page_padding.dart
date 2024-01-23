import 'package:flutter/material.dart';

EdgeInsets wPagePadding({double? left, double? right, double? top, double? bottom}){
  return EdgeInsets.only(
    top: top??64,
    left: left??32,
    right: right??32,
    bottom: bottom??0,
  );
}