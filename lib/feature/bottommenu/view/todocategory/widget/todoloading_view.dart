import 'package:flutter/material.dart';

// pub dev
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:kartal/kartal.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// wşdget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class TodoLoadingView extends StatelessWidget {
  const TodoLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.normal,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // img
              LoadingAnimationWidget.hexagonDots(
                color: ColorBackgroundConstant.purplePrimary,
                size: 45,
              ),
              // explanation
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: LabelMediumGreyText(
                  textAlign: TextAlign.center,
                  text: StringTodoConstants.loadingTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
