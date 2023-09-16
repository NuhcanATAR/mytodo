import 'package:flutter/material.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class ForgotPassordWidget extends StatelessWidget {
  const ForgotPassordWidget({super.key, required this.serviceRouter});
  final dynamic serviceRouter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: () {
          serviceRouter.loginForgotPassRouterPush(context);
        },
        child: const LabelMediumGreyBoldText(
          text: StringLoginConstant.forgotPass,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
