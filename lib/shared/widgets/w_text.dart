import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget wText (String data,
    {Key? key,
      Key? textKey,
      TextStyle? style,
      StrutStyle? strutStyle,
      double minFontSize = 12,
      double maxFontSize = double.infinity,
      double stepGranularity = 1,
      List<double>? presetFontSizes,
      AutoSizeGroup? group,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      bool wrapWords = true,
      TextOverflow? overflow,
      Widget? overflowReplacement,
      double? textScaleFactor,
      int? maxLines, String?
    semanticsLabel}){
  return AutoSizeText(
    data,
    overflow: overflow,
    group: group,
    key: key,
    locale: locale,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    minFontSize: minFontSize,
    overflowReplacement: overflowReplacement,
    presetFontSizes: presetFontSizes,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    stepGranularity: stepGranularity,
    strutStyle: strutStyle,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    textKey: textKey,
    textScaleFactor: textScaleFactor,
    wrapWords: wrapWords,

  );

}

String obscureNumber(String number){
  return number.replaceRange(3, 10, "** *** **");
}