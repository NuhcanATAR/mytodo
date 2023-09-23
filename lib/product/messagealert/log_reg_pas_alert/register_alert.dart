import 'package:flutter/material.dart';

// constant
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class RegisterAlertService {
  RegisterAlertService(BuildContext context);

  void voidEmailDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: ImgIMGConstant.appRegisterImg.toImg3,
      ),
      content: const TitleMediumBlackBoldText(
        text: StringRegisterConstant.alertTitle,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const LabelMediumGreyBoldText(
              textAlign: TextAlign.center,
              text: "Tamam",
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  void voidRegisterEndDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: ImgIMGConstant.appRegisterSucImg.toImg3,
      ),
      content: const TitleMediumBlackBoldText(
        text: StringRegisterConstant.alerRegEndTitle,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const LabelMediumGreyBoldText(
              textAlign: TextAlign.center,
              text: "Tamam",
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
