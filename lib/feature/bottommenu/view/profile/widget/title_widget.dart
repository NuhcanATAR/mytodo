import 'package:flutter/material.dart';

// constant
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.maxWidth,
  });
  final dynamic maxWidth;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: maxWidth,
        child: const TitleMediumBlackGreyBoldText(
          textAlign: TextAlign.left,
          text: StringProfileConstants.title,
        ),
      ),
    );
  }
}
