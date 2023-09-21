import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/color_constant.dart';

class LabelMediumGreyText extends StatelessWidget {
  const LabelMediumGreyText(
      {required this.textAlign, required this.text, super.key});

  final String text;
  final dynamic textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: ColorTextConstant.grey,
        ),
      ),
    );
  }
}

class LabelMediumWhiteText extends StatelessWidget {
  const LabelMediumWhiteText(
      {required this.textAlign, required this.text, super.key});

  final String text;
  final dynamic textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: ColorTextConstant.white,
        ),
      ),
    );
  }
}

class LabelMediumGreyBoldText extends StatelessWidget {
  const LabelMediumGreyBoldText(
      {required this.textAlign, required this.text, super.key});

  final String text;
  final dynamic textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: ColorTextConstant.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LabelMediumBlackBoldText extends StatelessWidget {
  const LabelMediumBlackBoldText(
      {required this.textAlign, required this.text, super.key});

  final String text;
  final dynamic textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: ColorTextConstant.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LabelMediumMainColorText extends StatelessWidget {
  const LabelMediumMainColorText(
      {required this.textAlign, required this.text, super.key});

  final String text;
  final dynamic textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: ColorTextConstant.mainColor,
        ),
      ),
    );
  }
}

class LabelMediumRedColorText extends StatelessWidget {
  const LabelMediumRedColorText(
      {required this.textAlign, required this.text, super.key});

  final String text;
  final dynamic textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }
}
