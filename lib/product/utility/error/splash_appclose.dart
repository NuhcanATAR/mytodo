import 'package:flutter/material.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/body_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class SplashAppCloseView extends StatelessWidget {
  const SplashAppCloseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: ImgIMGConstant.appCloseImg.toImg),
            // title
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: TitleMediumBlackBoldText(
                text: StringSplashConstant.appCloseTitle,
                textAlign: TextAlign.center,
              ),
            ),
            // description
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: BodyMediumBlackGreyText(
                text: StringSplashConstant.appCloseDescription,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
