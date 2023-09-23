import 'package:flutter/material.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {super.key, required this.dynamicHeight, required this.maxWidth});
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      height: dynamicHeight(0.08),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorBackgroundConstant.purpleDarker,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: const LabelMediumWhiteText(
          text: StringSliderConstant.sliderLoginBtn,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
