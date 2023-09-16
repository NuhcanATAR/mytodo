import 'package:flutter/material.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({
    super.key,
    required this.maxWidth,
  });
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          // title
          SizedBox(
            width: maxWidth,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: TitleMediumBlackBoldText(
                  textAlign: TextAlign.left, text: StringLoginConstant.title),
            ),
          ),
          // sub title
          SizedBox(
            width: maxWidth,
            child: const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: LabelMediumGreyText(
                  textAlign: TextAlign.left,
                  text: StringLoginConstant.subTitle),
            ),
          ),
        ],
      ),
    );
  }
}
