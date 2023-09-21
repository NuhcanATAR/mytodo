import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/color_constant.dart';

class BodyMediumBlackGreyText extends StatelessWidget {
  const BodyMediumBlackGreyText(
      {required this.textAlign, required this.text, super.key});
  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: ColorTextConstant.blackGrey,
        ),
      ),
    );
  }
}

class BodyMediumBlackBoldText extends StatelessWidget {
  const BodyMediumBlackBoldText(
      {required this.textAlign, required this.text, super.key});
  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: ColorTextConstant.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
