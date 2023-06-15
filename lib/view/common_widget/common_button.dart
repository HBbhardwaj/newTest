import 'package:flutter/material.dart';
import 'package:ispection/view/common_widget/common_text_widget.dart';

class CommonButton extends StatelessWidget {
  String text;
  double width, height, fontSize;
  FontWeight fontWeight;
  FontStyle fontStyle;
  TextAlign textAlign;
  Gradient gradient;
  Color color, buttonPrimaryColor, buttonOnPrimaryColor;
  Function()? onTap;

  CommonButton(
      {required this.text,
      this.width = 150,
      this.height = 50,
      this.color = Colors.white,
      this.fontWeight = FontWeight.w200,
      this.fontStyle = FontStyle.normal,
      this.fontSize = 14,
      this.onTap,
      this.textAlign = TextAlign.left,
      this.buttonPrimaryColor = Colors.transparent,
      this.buttonOnPrimaryColor = Colors.transparent,
      this.gradient = const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.7, 0.9],
          tileMode: TileMode.repeated,
          colors: [
            Color(0xff5E14E0),
            Color(0xff3917A3),
          ])});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(gradient: gradient),
      child: ElevatedButton(
        child: CommonTextWidget(
          text: text,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          color: color,
          textAlign: textAlign,
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonPrimaryColor, // background
          onPrimary: buttonOnPrimaryColor, // foreground
        ),
        onPressed: onTap!,
      ),
    );
  }
}
