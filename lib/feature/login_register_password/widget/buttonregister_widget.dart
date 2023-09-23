import 'package:flutter/material.dart';

// pub dev
import 'package:animate_do/animate_do.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.serviceRouter,
    required this.maxWidth,
    required this.dynamicHeight,
  });

  final dynamic serviceRouter;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () {
            serviceRouter.logRegRegisterViewPush(context);
          },
          child: SizedBox(
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
                text: StringSliderConstant.sliderRegisterBtn,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
