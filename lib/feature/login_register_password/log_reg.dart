import 'package:flutter/material.dart';

// pub dev
import 'package:kartal/kartal.dart';

// widget
import 'package:mytodo/feature/login_register_password/widget/body_widget.dart';
import 'package:mytodo/feature/login_register_password/widget/buttonlogin_widget.dart';
import 'package:mytodo/feature/login_register_password/widget/buttonregister_widget.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// base
import 'package:mytodo/product/utility/base/slider_base/slider_base.dart';

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
            buildBodyWidget,
            // btn login
            buildButtonLoginWidget,
            // btn register
            buildButtonRegisterWidget,
          ],
        ),
      ),
    );
  }

  // body
  Widget get buildBodyWidget => const BodyWidget();

  // btn login
  Widget get buildButtonLoginWidget => LoginButton(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        serviceRouter: serviceRouter,
      );

  // btn register
  Widget get buildButtonRegisterWidget => RegisterButton(
        maxWidth: maxWidth,
        serviceRouter: serviceRouter,
        dynamicHeight: dynamicHeight,
      );
}
