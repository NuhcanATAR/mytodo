import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/login_register_password/register/widget/titlesubtitle_widget.dart';
import 'package:mytodo/feature/login_register_password/register/widget/registerbtn_widget.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/utility/base/log_reg_pass_base/register_base/register_base.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends MainRegisterBase<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      body: Form(
        key: serviceModel.formRegisterKey,
        child: Padding(
          padding: context.padding.normal,
          child: ListView(
            children: <Widget>[
              // title & sub title
              buildTitleSubTitleWidget,
              // name surname widget
              buildNameSurnameWidget,
              // email
              buildEmailinputWidget,
              // password
              buildPasswordinputWidget,
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
  // name surname widget
  Widget get buildNameSurnameWidget => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Row(
          children: <Widget>[
            // name
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: TextFormField(
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: ColorTextConstant.blackGrey,
                  ),
                ),
                controller: serviceModel.nameController,
                validator: serviceModel.nameValidator,
                onTap: () {
                  setState(() {
                    serviceModel.isNameinp = true;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: serviceModel.isNameinp == false
                          ? Colors.transparent
                          : ColorBackgroundConstant.purplePrimary,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: serviceModel.isNameinp
                      ? Colors.white
                      : Colors.grey.withOpacity(0.2),
                  prefixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: ColorTextConstant.grey,
                    size: 24,
                  ),
                  hintText: StringRegisterConstant.name,
                  hintStyle: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: ColorTextConstant.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            // surname
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: TextFormField(
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: ColorTextConstant.blackGrey,
                  ),
                ),
                controller: serviceModel.surnameController,
                validator: serviceModel.surnameValidator,
                onTap: () {
                  setState(() {
                    serviceModel.isSurnameinp = true;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: serviceModel.isSurnameinp == false
                          ? Colors.transparent
                          : ColorBackgroundConstant.purplePrimary,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: serviceModel.isSurnameinp
                      ? Colors.white
                      : Colors.grey.withOpacity(0.2),
                  prefixIcon: Icon(
                    Icons.account_box_outlined,
                    color: ColorTextConstant.grey,
                    size: 24,
                  ),
                  hintText: StringRegisterConstant.surname,
                  hintStyle: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: ColorTextConstant.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  // email get widget
  Widget get buildEmailinputWidget => Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
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
            hintText: StringRegisterConstant.email,
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
            hintText: StringRegisterConstant.password,
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: ColorTextConstant.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  // Register btn
  Widget get buildRegisterBtnWidget => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () {
            if (serviceModel.formRegisterKey.currentState!.validate()) {
              registerUser();
            }
          },
          child: RegisterButtonWidget(
              maxWidth: maxWidth, dynamicHeight: dynamicHeight),
        ),
      );
}
