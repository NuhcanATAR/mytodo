import 'package:flutter/material.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class RegisterBtnWidget extends StatelessWidget {
  const RegisterBtnWidget({super.key, required this.serviceRouter});
  final dynamic serviceRouter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const LabelMediumGreyText(
          textAlign: TextAlign.center,
          text: StringLoginConstant.registerText,
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            serviceRouter.loginRegisterRouterPush(context);
          },
          child: const LabelMediumGreyBoldText(
            textAlign: TextAlign.center,
            text: StringLoginConstant.registerBtnText,
          ),
        ),
      ],
    );
  }
}
