import 'package:flutter/material.dart';

// pub dev
import 'package:animate_do/animate_do.dart';

// constant
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/body_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // ımg
          FadeInUp(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ImgIMGConstant.appSliderEndImg.toImg2,
            ),
          ),
          // title
          FadeInUp(
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: TitleMediumBlackBoldText(
                textAlign: TextAlign.center,
                text: StringSliderConstant.sliderEndTitle,
              ),
            ),
          ),
          // description
          FadeInUp(
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: BodyMediumBlackGreyText(
                text: StringSliderConstant.sliderEndSubTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
