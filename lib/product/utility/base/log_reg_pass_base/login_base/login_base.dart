import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';
import 'package:mytodo/product/messagealert/log_reg_pas_alert/login_alert.dart';
import 'package:mytodo/product/models/log_reg_pass_model/login/login_model.dart';
import 'package:mytodo/product/router/log_reg_pass_router/login_router.dart';
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
}
