import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    this.title,
    this.maxLines,
    this.textAlign,
    // @required this.txtName,
    this.size,
    this.decoration,
    this.color,
    this.fontWeight,
    this.height,
  }) : super(key: key);

  final String? title;
  final int? maxLines;
  final textAlign;
  final String txtName = "Modelica";
  final double?  size;
  final decoration;
  final Color? color;
  final fontWeight;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      maxLines: maxLines,
      overflow: TextOverflow.clip,
      softWrap: true,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: txtName,
        fontSize: size,
        decoration: decoration,
        fontWeight: fontWeight,
        color: color,
        height: height,
        //letterSpacing: 1.0,
        //wordSpacing: 0.5,
      ),
    );
  }
}
