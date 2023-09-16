import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mytodo/feature/bottommenu/bottommenu.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

//

class LoadingRouterView extends StatefulWidget {
  const LoadingRouterView({super.key});

  @override
  State<LoadingRouterView> createState() => _LoadingRouterViewState();
}

class _LoadingRouterViewState extends State<LoadingRouterView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 4,
        ), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const BottomMenuView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // loading
            buildLoadingWidget,
            // title
            buildTitleWidget,
          ],
        ),
      ),
    );
  }

  Widget get buildLoadingWidget => LoadingAnimationWidget.hexagonDots(
        color: ColorBackgroundConstant.purplePrimary,
        size: 45,
      );

  Widget get buildTitleWidget => const Padding(
        padding: EdgeInsets.all(20),
        child: TitleMediumBlackBoldText(
          textAlign: TextAlign.center,
          text: "Lütfen Bekleyiniz...",
        ),
      );
}
