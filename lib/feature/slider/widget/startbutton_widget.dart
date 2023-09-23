import 'package:flutter/material.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class StartButton extends StatelessWidget {
  const StartButton(
      {super.key,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.serviceRouter});
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic serviceRouter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          serviceRouter.sliderLogRegViewPush(context);
        },
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.08),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorBackgroundConstant.purplePrimary,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: const LabelMediumWhiteText(
              text: StringSliderConstant.sliderNextBtn,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
