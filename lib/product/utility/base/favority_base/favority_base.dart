import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';
import 'package:mytodo/product/models/favority_model/favority_model.dart';
import 'package:mytodo/product/router/favority_router/favority_router.dart';
import 'package:mytodo/product/utility/firebase/database/todo_db/todo_db.dart';
import 'package:mytodo/product/utility/firebase/service/firebase_service.dart';

abstract class MainFavorityBase<T extends StatefulWidget> extends State<T> {
  // model & database
  FavorityModelService serviceModel = FavorityModelService();
  FirebaseService firebaseService = FirebaseService();

  // router service
  FavorityRouterService routerService = FavorityRouterService();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;

  // todo favorite delete
  Future<void> todoFavoriteDelete(Map<String, dynamic> data) async {
    return await TodoServiceDb.FAVORITE.refFavoCol
        .doc(data['ID'])
        .delete()
        .then((value) {
      serviceModel.logger.i("Favoriden Kaldırıldı");
    }).catchError((err) {
      serviceModel.logger.e("Hata Oluştu");
    });
  }

  // todo important add
  Future<void> todoImportantAdd(Map<String, dynamic> data) async {
    return await TodoServiceDb.IMPORTANT.refImportantCol.doc(data['ID']).set({
      "USERID": firebaseService.userID,
      "TODOID": data['ID'],
      "DATE": FieldValue.serverTimestamp(),
    }).then((value) {
      serviceModel.logger.i("Önemli Listeye Eklendi");
    }).catchError((err) {
      serviceModel.logger.e("Hata Oluştu");
    });
  }

  // todo important delete
  Future<void> todoImportantDelete(Map<String, dynamic> data) async {
    return await TodoServiceDb.IMPORTANT.refImportantCol
        .doc(data['ID'])
        .delete()
        .then((value) {
      serviceModel.logger.i("Önemli Listeden Kaldırıldı");
    }).catchError((err) {
      serviceModel.logger.e("Hata Oluştu");
    });
  }

  // todo delete
  Future<void> todoDelete(
      Map<String, dynamic> data, Map<String, dynamic> mainData) async {
    if (mainData['ID'] == "0qXiPbGgtwu3j1r5j5Lz") {
      return TodoServiceDb.TODOS.refMeetingCol
          .doc(data['CATEGORYID'])
          .delete()
          .then((value) {
        serviceModel.logger.i("Todo Kaldırıldı");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Todo Kaldırıldı!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        serviceModel.logger.i("Todo Silinme Hatası: $err");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Bir Soru Oluştu!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else if (mainData['CATEGORYID'] == "GMwLSlyI6e2fY1N8JsLQ") {
      return TodoServiceDb.TODOS.refGoingPlaceCol
          .doc(data['ID'])
          .delete()
          .then((value) {
        serviceModel.logger.i("Todo Kaldırıldı");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Todo Kaldırıldı!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        serviceModel.logger.i("Todo Silinme Hatası: $err");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Bir Soru Oluştu!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else if (mainData['ID'] == "QqqKN0VbdWfofliUtDm6") {
      return TodoServiceDb.TODOS.refStudyPlaceCol
          .doc(data['ID'])
          .delete()
          .then((value) {
        serviceModel.logger.i("Todo Kaldırıldı");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Todo Kaldırıldı!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        serviceModel.logger.i("Todo Silinme Hatası: $err");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Bir Soru Oluştu!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else if (mainData['ID'] == "RjFvWQe3dpW34QAxX2v7") {
      return TodoServiceDb.TODOS.refBooksPlaceCol
          .doc(data['ID'])
          .delete()
          .then((value) {
        serviceModel.logger.i("Todo Kaldırıldı");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Todo Kaldırıldı!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        serviceModel.logger.i("Todo Silinme Hatası: $err");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Bir Soru Oluştu!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else if (mainData['ID'] == "SXrN07acJwhryUdzVwIQ") {
      return TodoServiceDb.TODOS.refShoppingPlaceCol
          .doc(data['ID'])
          .delete()
          .then((value) {
        serviceModel.logger.i("Todo Kaldırıldı");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Todo Kaldırıldı!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        serviceModel.logger.i("Todo Silinme Hatası: $err");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Bir Soru Oluştu!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else if (mainData['ID'] == "ZaqqOF15uH11kMv0vdHu") {
      return TodoServiceDb.TODOS.refHealtPlaceCol
          .doc(data['ID'])
          .delete()
          .then((value) {
        serviceModel.logger.i("Todo Kaldırıldı");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Todo Kaldırıldı!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        serviceModel.logger.i("Todo Silinme Hatası: $err");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Bir Soru Oluştu!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else if (mainData['ID'] == "fYGlLPTeMpPCYfirfleu") {
      return TodoServiceDb.TODOS.refSporPlaceCol
          .doc(data['ID'])
          .delete()
          .then((value) {
        serviceModel.logger.i("Todo Kaldırıldı");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Todo Kaldırıldı!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        serviceModel.logger.i("Todo Silinme Hatası: $err");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Bir Soru Oluştu!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else if (mainData['ID'] == "wNtyPEvvFYoWjI36TSJy") {
      return TodoServiceDb.TODOS.refMoviePlaceCol
          .doc(data['ID'])
          .delete()
          .then((value) {
        serviceModel.logger.i("Todo Kaldırıldı");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Todo Kaldırıldı!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        serviceModel.logger.i("Todo Silinme Hatası: $err");
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('Bir Soru Oluştu!'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  // meeting update
  Future<void> meetinUpdate(
    Map<String, dynamic> mainData,
    TextEditingController title,
    TextEditingController explanation,
    DateTime date,
  ) async {
    return await TodoServiceDb.TODOS.refMeetingCol.doc(mainData['ID']).update({
      "TITLE": title.text,
      "EXPLANATION": explanation.text,
      "DAY": date.day,
      "MONTH": date.month,
      "YEAR": date.year,
    }).then((value) {
      serviceModel.logger.i("Toplantı Planı Güncellendi!");
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
    });
  }

  // todo book update
  Future<void> bookUpdate(
      Map<String, dynamic> mainData,
      TextEditingController title,
      TextEditingController explanation,
      int pageCount) async {
    return TodoServiceDb.TODOS.refBooksPlaceCol.doc(mainData['ID']).update({
      "TITLE": title.text,
      "EXPLANATION": explanation.text,
      "PAGECOUNT": pageCount,
      "CATEGORY": mainData['CATEGORY'],
    }).then((value) {
      serviceModel.logger.i("Kitap Güncllendi");
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
    });
  }

  // todo going to place update
  Future<void> goingToPLaceUpdate(
      Map<String, dynamic> mainData,
      TextEditingController title,
      TextEditingController explanation,
      DateTime dateStart,
      DateTime dateFinish) async {
    return TodoServiceDb.TODOS.refGoingPlaceCol.doc(mainData['ID']).update({
      "TITLE": title.text,
      "EXPLANATION": explanation.text,
      "STARTDAY": dateStart.day,
      "STARTMONTH": dateStart.month,
      "STARTYEAR": dateStart.year,
      "ENDDAY": dateFinish.day,
      "ENDMONTH": dateFinish.month,
      "ENDYEAR": dateFinish.year,
      "STARTLOCATION": mainData['STARTLOCATION'],
      "FINISHLOCATION": mainData['FINISHLOCATION'],
    }).then((value) {
      serviceModel.logger.i("Seyahat Planı Güncellendi!");
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
    });
  }

  // todo study plan update
  Future<void> studyUpdate(
      Map<String, dynamic> mainData,
      TextEditingController title,
      TextEditingController explanation,
      DateTime dateStart,
      DateTime dateFinish) async {
    return TodoServiceDb.TODOS.refStudyPlaceCol.doc(mainData['ID']).update({
      "TITLE": title.text,
      "EXPLANATION": explanation.text,
      "STARTDAY": dateStart.day,
      "STARTMONTH": dateStart.month,
      "STARTYEAR": dateStart.year,
      "ENDDAY": dateFinish.day,
      "ENDMONTH": dateFinish.month,
      "ENDYEAR": dateFinish.year,
    }).then((value) {
      serviceModel.logger.i("Çalışma Planı Güncellendi!");
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
    });
  }

  // shopping list update
  Future<void> shoppingListUpdate(Map<String, dynamic> mainData,
      TextEditingController title, TextEditingController explanation) async {
    return await TodoServiceDb.TODOS.refShoppingPlaceCol
        .doc(mainData['ID'])
        .update({
      "TITLE": title.text,
      "EXPLANATION": explanation.text,
      "CATEGORY": mainData['CATEGORY'],
    }).then((value) {
      serviceModel.logger.i("Alışveriş Listesi Güncellendi!");
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
    });
  }

  // health plan update
  Future<void> healtPLanUpdate(
      Map<String, dynamic> mainData,
      TextEditingController title,
      TextEditingController explanation,
      DateTime goingDate) async {
    return await TodoServiceDb.TODOS.refHealtPlaceCol
        .doc(mainData['ID'])
        .update({
      "TITLE": title.text,
      "EXPLANATION": explanation.text,
      "GOINGDAY": goingDate.day,
      "GOINGMONTH": goingDate.month,
      "GOINGYEAR": goingDate.year,
      "CATEGORY": mainData['CATEGORY'],
    }).then((value) {
      serviceModel.logger.i("Sağlık Planı Güncellendi!");
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
    });
  }

  // spor plan update
  Future<void> sporUpdate(
      Map<String, dynamic> mainData,
      TextEditingController title,
      TextEditingController explanation,
      DateTime goingDate) async {
    return await TodoServiceDb.TODOS.refSporPlaceCol
        .doc(mainData['ID'])
        .update({
      "TITLE": title.text,
      "EXPLANATION": explanation.text,
      "GOINGDAY": goingDate.day,
      "GOINGMONTH": goingDate.month,
      "GOINGYEAR": goingDate.year,
      "CATEGORY": mainData['CATEGORY'],
    }).then((value) {
      serviceModel.logger.i("Spor Planı Güncellendi!");
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
    });
  }

  // movie update
  Future<void> movieListUpdate(
    Map<String, dynamic> mainData,
    TextEditingController title,
    TextEditingController explanation,
  ) async {
    return await TodoServiceDb.TODOS.refMoviePlaceCol
        .doc(mainData['ID'])
        .update({
      "TITLE": title.text,
      "EXPLANATION": explanation.text,
      "CATEGORY": mainData['CATEGORY'],
    }).then((value) {
      serviceModel.logger.i("Dizi & Film Listesi Güncellendi!");
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
    });
  }
}
