import 'package:flutter/material.dart';

// extension
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';

// model
import 'package:mytodo/product/models/profile_model/profile_model.dart';

// view routers
import 'package:mytodo/product/router/profile_router/profile_router.dart';

// database
import 'package:mytodo/product/utility/firebase/service/firebase_service.dart';
import 'package:mytodo/product/utility/firebase/database/profile_db/profiledb.dart';

abstract class MainProfileBase<T extends StatefulWidget> extends State<T> {
  // model & database
  FirebaseService firebaseService = FirebaseService();
  ProfileServiceModel serviceModel = ProfileServiceModel();
  // router service
  ProfileRouterService routerService = ProfileRouterService();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;

  // name surname upd
  Future<void> nameSurnameUpd(Map<String, dynamic> data,
      TextEditingController name, TextEditingController surname) async {
    return await ProfileDb.USERS.userRefColTable.update({
      "NAME": name.text,
      "SURNAME": surname.text,
    }).then((value) {
      serviceModel.logger.i("Güncellendi");
      final snackBar = SnackBar(
        content: const Text('Ad Soyad Güncellendi!'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((err) {
      serviceModel.logger.e("Hata oluştu");
    });
  }

  // reset pass send mail
  Future<void> sendResEmail() async {
    await firebaseService.auth
        .sendPasswordResetEmail(
      email: serviceModel.password.text.toString(),
    )
        .then((value) {
      serviceModel.logger.i("Sıfırlama Email Gönderildi");
      final snackBar = SnackBar(
        content: const Text('Sıfırlama Email Gönderildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.password.clear();
    }).catchError((err) {
      serviceModel.logger.i("Hata oluştu");
      final snackBar = SnackBar(
        content: const Text('Hata oluştu'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.password.clear();
    });
  }
}
