import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// base
import 'package:mytodo/product/utility/base/splash_base/splash_base.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends MainSplashViewBase<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.purplePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // logo
            buildLogo,
            // text
            buildText,
          ],
        ),
      ),
    );
  }

  // logo
  Widget get buildLogo => SizedBox(
      width: dynamicWidth(0.2),
      height: dynamicHeight(0.1),
      child: ImgLogoConstant.appLogo.toImg);
  // text
  Widget get buildText => DefaultTextStyle(
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.headlineSmall?.copyWith(
            color: ColorTextConstant.white,
          ),
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText("${StringSplashConstant.appName} ile"),
            TypewriterAnimatedText(StringSplashConstant.splashText1),
            TypewriterAnimatedText(StringSplashConstant.splashText2),
          ],
        ),
      );
}
