import 'package:flutter/material.dart';

// model & database
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class ResetBtnWidget extends StatelessWidget {
  const ResetBtnWidget(
      {super.key, required this.maxWidth, required this.dynamicHeight});
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
          text: StringForgotPasswordConstant.resetBtnMail,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
