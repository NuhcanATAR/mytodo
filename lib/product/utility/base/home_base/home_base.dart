import 'package:flutter/material.dart';

// model
import 'package:mytodo/product/models/home_model/home_model.dart';

// extension
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';

// view routers
import 'package:mytodo/product/router/home_router/home_router.dart';
import 'package:mytodo/feature/bottommenu/bottommenu.dart';

// database
import 'package:mytodo/product/utility/firebase/service/firebase_service.dart';
import 'package:mytodo/product/utility/firebase/database/home_db/homedb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MainHomeBase<T extends StatefulWidget> extends State<T> {
  // model & database
  HomeModelService serviceModel = HomeModelService();
  FirebaseService firebaseService = FirebaseService();

  // router service
  HomeViewRouterService routerService = HomeViewRouterService();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;

  // note add
  Future<void> notAdd() async {
    return await HomeServiceDb.NOTES.refAddCol.add({
      "ID": null,
      "USERID": serviceModel.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "DATE": FieldValue.serverTimestamp(),
    }).then((value) {
      String valueDocID = value.id;

      value.update({"ID": valueDocID});

      serviceModel.logger.i("Not Eklendi!");
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('Not Oluşturuldu!'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.i("Hata!: $err");
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('Not Oluşturulamadı!!'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    });
  }

  // note delete
  Future<void> notDelete(Map<String, dynamic> data) async {
    return await HomeServiceDb.NOTES.refDeleteCol
        .doc(data['ID'].toString())
        .delete()
        .then((value) {
      serviceModel.logger.i("Not Kaldırıldı!");
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomMenuView(),
        ),
      );
    }).catchError((err) {
      serviceModel.logger.i("Hata oluştu!");
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomMenuView(),
        ),
      );
    });
  }

  // note update
  Future<void> notUpd(Map<String, dynamic> data) async {
    return await HomeServiceDb.NOTES.refAddCol
        .doc(data['ID'].toString())
        .update({
      "TITLE": serviceModel.titleUpdController(data).text,
      "EXPLANATION": serviceModel.explanationUpdController(data).text,
    }).then((value) {
      serviceModel.logger.i("Not Güncellendi!");
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('Not Güncellendi!'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      serviceModel.titleUpdController(data).clear();
      serviceModel.explanationUpdController(data).clear();
    }).catchError((err) {
      serviceModel.logger.i("Hata!: $err");
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('Not Güncelleme Hatası!!'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleUpdController(data).clear();
      serviceModel.explanationUpdController(data).clear();
    });
  }
}
