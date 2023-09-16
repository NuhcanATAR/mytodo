import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/utility/base/slider_base/slider_base.dart';
import 'package:mytodo/product/widget/text_widget/body_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class LogRegView extends StatefulWidget {
  const LogRegView({super.key});

  @override
  State<LogRegView> createState() => _LogRegViewState();
}

class _LogRegViewState extends MainSliderBase<LogRegView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      body: Padding(
        padding: context.padding.normal,
        child: Column(
          children: <Widget>[
            // body
            Expanded(
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
            ),
            // btn login
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    serviceRouter.logRegLoginViewPush(context);
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
                        text: StringSliderConstant.sliderLoginBtn,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // btn register
            FadeInRight(
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
            ),
          ],
        ),
      ),
    );
  }
}
