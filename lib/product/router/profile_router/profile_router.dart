import 'package:flutter/material.dart';

// pub dev
import 'package:firebase_auth/firebase_auth.dart';

// viw router
import 'package:mytodo/feature/bottommenu/view/profile/view/emailupd_view.dart';
import 'package:mytodo/feature/bottommenu/view/profile/view/namesurnameupd_view.dart';
import 'package:mytodo/feature/bottommenu/view/profile/view/passwordupd_view.dart';
import 'package:mytodo/feature/login_register_password/login/login.dart';

// pub dev
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRouterService {
  // back context
  void backViewPopRouter(BuildContext context) {
    Navigator.pop(context);
  }

  // name surname upd view router
  void userNameSurnameUpdRouterView(BuildContext context, data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NameSurnameUpdView(
          data: data,
        ),
      ),
    );
  }

  // email upd view router
  void emailUpdRouterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailUpdView(),
      ),
    );
  }

  // password upd view router
  void passwordUpdRouterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordUpdView(),
      ),
    );
  }

  // exit account
  void userExitAccount(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("remember_me", false).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
          (Route<dynamic> route) => false);
    });
  }
}
