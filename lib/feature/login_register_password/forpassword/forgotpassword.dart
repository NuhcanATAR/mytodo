import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// model & database
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/utility/base/log_reg_pass_base/password_base/password_base.dart';

// theme
import 'package:mytodo/product/constants/color_constant.dart';

// widget
import 'package:mytodo/feature/login_register_password/forpassword/widget/resetbtn_widget.dart';
import 'package:mytodo/feature/login_register_password/forpassword/widget/titlesubtitle_widget.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState
    extends MainForgotPasswordBase<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      body: Form(
        key: serviceModel.formResPassKey,
        child: Padding(
          padding: context.padding.normal,
          child: ListView(
            children: <Widget>[
              // title & sub title
              buildTitleSubTitleWidget,
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

  // title & sub title get widget
  Widget get buildTitleSubTitleWidget =>
      TitleSubTitleWidget(maxWidth: maxWidth);
  // email get widget
  Widget get buildEmailinputWidget => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: TextFormField(
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: ColorTextConstant.blackGrey,
            ),
          ),
          controller: serviceModel.emailController,
          validator: serviceModel.emailValidator,
          onTap: () {
            setState(() {
              serviceModel.isEmailinp = true;
            });
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: serviceModel.isEmailinp == false
                    ? Colors.transparent
                    : ColorBackgroundConstant.purplePrimary,
                width: 1,
              ),
            ),
            filled: true,
            fillColor: serviceModel.isEmailinp
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
            if (serviceModel.formResPassKey.currentState!.validate()) {
              sendResEmail();
            }
          },
          child:
              ResetBtnWidget(maxWidth: maxWidth, dynamicHeight: dynamicHeight),
        ),
      );
}
