import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// base
import 'package:mytodo/product/utility/base/profile_base/profile_base.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class PasswordUpdView extends StatefulWidget {
  const PasswordUpdView({super.key});

  @override
  State<PasswordUpdView> createState() => _PasswordUpdViewState();
}

class _PasswordUpdViewState extends MainProfileBase<PasswordUpdView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            routerService.backViewPopRouter(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.purplePrimary,
            size: 21,
          ),
        ),
        title: Text(
          "Şifre yenile",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorTextConstant.mainColor,
            ),
          ),
        ),
      ),
      body: Form(
        key: serviceModel.passwordUpdKey,
        child: Padding(
          padding: context.padding.normal,
          child: ListView(
            children: <Widget>[
              // email
              buildEmailinputWidget,
              // reset btn
              buildResetBtnWidget,
            ],
          ),
        ),
      ),
    );
  }

  // email get widget
  Widget get buildEmailinputWidget => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextFormField(
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: ColorTextConstant.blackGrey,
            ),
          ),
          controller: serviceModel.password,
          validator: serviceModel.passValidator,
          onTap: () {
            setState(() {
              serviceModel.inputBorder = true;
            });
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: serviceModel.inputBorder == false
                    ? Colors.transparent
                    : ColorBackgroundConstant.purplePrimary,
                width: 1,
              ),
            ),
            filled: true,
            fillColor: serviceModel.inputBorder
                ? Colors.white
                : Colors.grey.withOpacity(0.2),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: ColorTextConstant.grey,
              size: 24,
            ),
            hintText: StringForgotPasswordConstant.email,
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: ColorTextConstant.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  // reset btn
  Widget get buildResetBtnWidget => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () {
            if (serviceModel.passwordUpdKey.currentState!.validate()) {
              sendResEmail();
            }
          },
          child: SizedBox(
            width: maxWidth,
            height: dynamicHeight(0.08),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorBackgroundConstant.purpleDarker,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const LabelMediumWhiteText(
                text: StringForgotPasswordConstant.resetBtnMail,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}
