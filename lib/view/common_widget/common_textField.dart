import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  String txt;
  Color? colour;
  double? fontSize, textHeight;
  bool? bold = false;
  FontWeight fontWeight;
  TextAlign alignment;
  TextDecoration textDecoration;
  FontStyle fontStyle;

  TextOverflow textOverflow;

  CustomText(
      {Key? key,
      required this.txt,
      this.colour,
      this.fontSize,
      this.bold,
      required this.alignment,
      this.fontWeight = FontWeight.normal,
      
      this.fontStyle = FontStyle.normal,
      this.textDecoration = TextDecoration.none,
      this.textHeight = 1.0,
      this.textOverflow = TextOverflow.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: alignment,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontSize,
        color: colour,
        fontWeight: bold == true ? FontWeight.bold : fontWeight,
        decoration: textDecoration,
        fontStyle: fontStyle,
        height: textHeight,
      ),
    );
  }
}
