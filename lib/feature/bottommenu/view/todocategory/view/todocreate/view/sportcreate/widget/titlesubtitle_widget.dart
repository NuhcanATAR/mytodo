import 'package:flutter/material.dart';

// constant
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({super.key, required this.maxWidth});
  final dynamic maxWidth;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        buildTitleWidget,
        // sub title
        buildSubTitleWidget,
      ],
    );
  }

  // title
  Widget get buildTitleWidget => SizedBox(
        width: maxWidth,
        child: const TitleMediumBlackBoldText(
          text: StringTodoConstants.sportTitle,
          textAlign: TextAlign.left,
        ),
      );
  // sub title
  Widget get buildSubTitleWidget => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: maxWidth,
          child: const LabelMediumGreyText(
            text: StringTodoConstants.sportSubTitle,
            textAlign: TextAlign.left,
          ),
        ),
      );
}
