import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// extension
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';

// database
import 'package:firebase_auth/firebase_auth.dart';

// model
import 'package:mytodo/product/models/log_reg_pass_model/login/login_model.dart';

// view routers
import 'package:mytodo/product/router/log_reg_pass_router/login_router.dart';
import 'package:mytodo/product/messagealert/log_reg_pas_alert/login_alert.dart';

// firebase
import 'package:mytodo/product/utility/firebase/service/firebase_service.dart';

abstract class MainLoginBase<T extends StatefulWidget> extends State<T> {
  // model & database
  LoginServiceModel serviceModel = LoginServiceModel();
  FirebaseService firebaseService = FirebaseService();
  // router service
  LoginRouterService serviceRouter = LoginRouterService();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;

  // connectivity status
  getConnnectivityStatus() => serviceModel.subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        serviceModel.isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
        if (!serviceModel.isDeviceConnected &&
            serviceModel.isAlertDialog == false) {
          showDialogBox();
          setState(() {
            serviceModel.isAlertDialog = true;
          });
        }
      });

  showDialogBox() => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.wifi_off_rounded,
            color: Colors.redAccent,
            size: 55,
          ),
          content: Text(
            'İnternet bağlantınız yok! Lütfen tekrar deneyiniz.',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => serviceModel.isAlertDialog = false);
                  serviceModel.isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!serviceModel.isDeviceConnected &&
                      serviceModel.isAlertDialog == false) {
                    showDialogBox();
                    setState(() => serviceModel.isAlertDialog = true);
                  }
                },
                child: Text(
                  'Tekrar Dene',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorBackgroundConstant.purplePrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );

  // auth login
  Future<void> loginDb(context) async {
    try {
      UserCredential userCredential = await firebaseService.auth
          .signInWithEmailAndPassword(
              email: serviceModel.emailController.text.toString(),
              password: serviceModel.passwordController.text.toString());

      User? user = userCredential.user;

      if (!user!.emailVerified) {
        throw FirebaseAuthException(
          code: 'email-no-verified',
          message: 'E-postanızı doğrulamadan giriş yapamazsınız!',
        );
      }

      serviceRouter.loginLoadingAnimationRouterPush(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        LoginAlertService(context).userNotFountDialog(context);
      } else if (e.code == 'wrong-password') {
        LoginAlertService(context).wrontPasswordDialog(context);
      } else if (e.code == 'too-many-requests') {
        LoginAlertService(context).tooManyRequestDialog(context);
      } else if (e.code == 'email-not-verified') {
        LoginAlertService(context).emailNotVerifiedDialog(context);
      }
    } catch (e) {
      serviceModel.logger.e("Hata: $e");
    }
  }

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
}
