import 'package:flutter/material.dart';
import 'package:mytodo/product/constants/string_constant.dart';
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
          text: StringTodoConstants.meetingUpdateTitle,
          textAlign: TextAlign.left,
        ),
      );
  // sub title
  Widget get buildSubTitleWidget => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: maxWidth,
          child: LabelMediumGreyText(
            text: StringTodoConstants.meetingUpdateSubTitle,
            textAlign: TextAlign.left,
          ),
        ),
      );
}
