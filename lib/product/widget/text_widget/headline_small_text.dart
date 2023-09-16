import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/color_constant.dart';

class HeadlineSmallText extends StatelessWidget {
  const HeadlineSmallText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.headlineSmall?.copyWith(
          color: ColorTextConstant.white,
        ),
      ),
    );
  }
}

class HeadlineSmallBlackBoldText extends StatelessWidget {
  const HeadlineSmallBlackBoldText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.headlineSmall?.copyWith(
          color: ColorTextConstant.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
