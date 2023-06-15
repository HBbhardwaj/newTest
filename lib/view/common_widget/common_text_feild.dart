import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  String hintText;
  FontWeight fontWeight, hintWeight;
  double fontSize, hintSize;
  Color textColor, hintColor;
  TextAlign textAlign;
  FontStyle fontStyle;
  bool isHide, isEnabled;
  TextInputType textInputType;
  TextEditingController controller;
  TextInputAction textInputAction;
  dynamic maxLength, maxNumber;
  Function? onchange;

  CommonTextField({
    Key? key,
    required this.hintText,
    this.isEnabled = true,
    this.textInputType = TextInputType.text,
    this.fontWeight = FontWeight.w300,
    this.fontSize = 16,
    this.hintSize = 16,
    this.hintWeight = FontWeight.w300,
    this.hintColor = Colors.black,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.start,
    this.textColor = Colors.black,
    required this.controller,
    required this.textInputAction,
    this.isHide = false,
    this.maxLength = null,
    this.maxNumber = null,
    this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign,
      controller: controller,
      maxLength: maxLength,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxNumber),
      ],
      enabled: isEnabled,
      keyboardType: textInputType,
      obscureText: isHide,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: hintWeight,
            fontSize: hintSize,
            color: hintColor,
          )),
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
        fontStyle: fontStyle,
      ),
      onChanged: ((value) => onchange),
    );
  }
}
