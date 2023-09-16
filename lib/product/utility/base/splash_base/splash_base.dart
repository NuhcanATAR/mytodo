import 'package:flutter/material.dart';
import 'package:mytodo/product/router/splash/splash_router.dart';

abstract class MainSplashViewBase<T extends StatefulWidget> extends State<T> {
  // model & database

  // router service
  SplashNavigatorRouter serviceRouter = SplashNavigatorRouter();

  // screen size
  double dynamicWidth(double value) => MediaQuery.sizeOf(context).width * value;
  double dynamicHeight(double value) =>
      MediaQuery.sizeOf(context).height * value;

  // auto router slider view
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      serviceRouter.splashSliderRouterPush(context);
    });
  }
}
