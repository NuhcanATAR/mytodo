import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class TodoErrorView extends StatelessWidget {
  const TodoErrorView({super.key});

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
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ImgIMGConstant.appTodoViewImg.toImg8,
              ),
              // title
              const Padding(
                padding: EdgeInsets.all(5),
                child: TitleMediumBlackBoldText(
                  textAlign: TextAlign.center,
                  text: StringTodoConstants.errorTodoTitle,
                ),
              ),
              // explanation
              const LabelMediumGreyText(
                textAlign: TextAlign.center,
                text: StringTodoConstants.errorTodoSubTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
