import 'package:flutter/material.dart';

// view routers
import 'package:mytodo/feature/slider/slider.dart';
import 'package:mytodo/product/utility/error/splash_error.dart';

class SplashNavigatorRouter {
  // slider router push
  void splashSliderRouterPush(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SliderView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
        (Route<dynamic> route) => false);
  }

  void splashAppCloseRouterPush(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashErrorView(),
        ),
        (Route<dynamic> route) => false);
  }
}
