import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/login_register_password/login/widget/forgotpass_widget.dart';
import 'package:mytodo/feature/login_register_password/login/widget/loginbtn_widget.dart';
import 'package:mytodo/feature/login_register_password/login/widget/registerbtn_widget.dart';
import 'package:mytodo/feature/login_register_password/login/widget/titlesubtitle_widget.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/utility/base/log_reg_pass_base/login_base/login_base.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends MainLoginBase<LoginView> {
  @override
  void initState() {
    super.initState();

    getConnnectivityStatus();
    _loadUserEmailPassword();
  }

  // ignore: unused_element
  void _loadUserEmailPassword() async {
    // ignore: avoid_print
    print("Load Email");
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      // ignore: no_leading_underscores_for_local_identifiers
      var _email = _prefs.getString("email") ?? "";
      // ignore: no_leading_underscores_for_local_identifiers
      var _password = _prefs.getString("password") ?? "";
      // ignore: no_leading_underscores_for_local_identifiers
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      // ignore: avoid_print
      print(_remeberMe);
      // ignore: avoid_print
      print(_email);
      // ignore: avoid_print
      print(_password);
      if (_remeberMe) {
        setState(() {
          serviceModel.isRememberChecked = true;
        });
        serviceModel.emailController.text = _email;
        serviceModel.passwordController.text = _password;
        // ignore: use_build_context_synchronously
        serviceRouter.loginBottomMenuRouterPush(context);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // connection controller
  @override
  void dispose() {
    serviceModel.subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      body: Form(
        key: serviceModel.formLoginKey,
        child: Padding(
          padding: context.padding.normal,
          child: ListView(
            children: <Widget>[
              // title & sub title
              buildTitleSubTitleWidget,
              // email
              buildEmailinputWidget,
              // password
              buildPasswordinputWidget,
              // forgot password
              buildForgotPasswordWidget,
              // remember me button
              buildRememberMeButtonWidget,
              // login btn
              buildLoginBtnWidget,
              // or
              buildOrWidget,
              // register btn
              buildRegisterBtnWidget,
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
            hintText: "Email Adresiniz",
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: ColorTextConstant.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  // password get widget
  Widget get buildPasswordinputWidget => Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: TextFormField(
          obscureText: serviceModel.isPassObscured,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: ColorTextConstant.blackGrey,
            ),
          ),
          controller: serviceModel.passwordController,
          validator: serviceModel.passwordValidator,
          onTap: () {
            setState(() {
              serviceModel.isPasswordinp = true;
            });
          },
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: serviceModel.isPasswordinp == false
                    ? Colors.transparent
                    : ColorBackgroundConstant.purplePrimary,
                width: 1,
              ),
            ),
            filled: true,
            fillColor: serviceModel.isPasswordinp
                ? Colors.white
                : Colors.grey.withOpacity(0.2),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: ColorTextConstant.grey,
              size: 24,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  serviceModel.isPassObscured = !serviceModel.isPassObscured;
                });
              },
              icon: Icon(
                serviceModel.isPassObscured
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey,
                size: 24,
              ),
            ),
            hintText: "Şifreniz",
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: ColorTextConstant.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  // forgot password
  Widget get buildForgotPasswordWidget =>
      ForgotPassordWidget(serviceRouter: serviceRouter);
  // remember me button
  Widget get buildRememberMeButtonWidget => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            // checkbox widget
            Checkbox(
              activeColor: ColorBackgroundConstant.purplePrimary,
              value: serviceModel.isRememberChecked,
              onChanged: (bool? value) {
                setState(() {
                  serviceModel.isRememberChecked = value!;
                });
                // ignore: avoid_print
                print("Handle Rember Me");
                serviceModel.isRememberChecked = value!;
                SharedPreferences.getInstance().then(
                  (prefs) {
                    prefs.setBool("remember_me", value);
                    prefs.setString('email', serviceModel.emailController.text);
                    prefs.setString(
                        'password', serviceModel.passwordController.text);
                  },
                );
                setState(() {
                  serviceModel.isRememberChecked = value;
                });
              },
            ),
            // text
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: const LabelMediumGreyBoldText(
                  text: StringLoginConstant.rememberMe,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      );

  // login btn
  Widget get buildLoginBtnWidget => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () {
            if (serviceModel.formLoginKey.currentState!.validate()) {
              loginDb(context);
            }
          },
          child: LoginButtonWidget(
              dynamicHeight: dynamicHeight, maxWidth: maxWidth),
        ),
      );

  // or
  Widget get buildOrWidget => Container(
        padding: const EdgeInsets.only(top: 40, bottom: 30),
        alignment: Alignment.center,
        child: const LabelMediumGreyBoldText(
          text: "veya",
          textAlign: TextAlign.center,
        ),
      );

  // register btn
  Widget get buildRegisterBtnWidget =>
      RegisterBtnWidget(serviceRouter: serviceRouter);
}
