import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';
import 'package:mytodo/product/models/todo_model/todo_model.dart';
import 'package:mytodo/product/router/todo_router/todo_router.dart';
import 'package:mytodo/product/utility/firebase/database/todo_db/todo_db.dart';
import 'package:mytodo/product/utility/firebase/service/firebase_service.dart';

abstract class MainTodoBase<T extends StatefulWidget> extends State<T> {
  // model & database
  TodoModelService serviceModel = TodoModelService();
  FirebaseService firebaseService = FirebaseService();

  // router service
  TodoNavigatorRouterService routerService = TodoNavigatorRouterService();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;

  // book page count
  void bookPageCountAdd() {
    setState(() {
      serviceModel.bookPageCount++;
    });
  }

  // date picker
  // ignore: non_constant_identifier_names
  void ShowDatePickerDialog() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: serviceModel.selectdateTime,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      helpText: "Tarih",
      confirmText: "Tamam",
      cancelText: "Kapat",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorBackgroundConstant.purplePrimary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (dateTime != null) {
      setState(() {
        serviceModel.selectdateTime = dateTime;
      });
    }
  }

  // start date picker
  // ignore: non_constant_identifier_names
  void ShowDateStartPickerDialog() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: serviceModel.selectdateTime,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      helpText: "Başlangıç Tarihi",
      confirmText: "Tamam",
      cancelText: "Kapat",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorBackgroundConstant.purplePrimary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (dateTime != null) {
      setState(() {
        serviceModel.selectStartdateTime = dateTime;
      });
    }
  }

  // end date picker
  // ignore: non_constant_identifier_names
  void ShowDateEndPickerDialog() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: serviceModel.selectdateTime,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      helpText: "Bitiş Tarihi",
      confirmText: "Tamam",
      cancelText: "Kapat",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorBackgroundConstant.purplePrimary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (dateTime != null) {
      setState(() {
        serviceModel.selectEnddateTime = dateTime;
      });
    }
  }

  // meeting add
  Future<void> meetingAdd() async {
    return await TodoServiceDb.TODOS.refMeetingCol.add({
      "ID": null,
      "USERID": firebaseService.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "DATE": FieldValue.serverTimestamp(),
      "DAY": serviceModel.selectdateTime.day,
      "MONTH": serviceModel.selectdateTime.month,
      "YEAR": serviceModel.selectdateTime.year,
      "STATUSCHECK": false,
    }).then((value) {
      String docID = value.id;
      value.update({"ID": docID});
      serviceModel.logger.i("Todo Toplantılara Kaydedildi!");
      final snackBar = SnackBar(
        content: const Text('Toplantı Planı Kaydedildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
      final snackBar = SnackBar(
        content: const Text('Todo Oluşturulamadı!'),
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

  // going place add
  Future<void> goingPlaceAdd(Map<String, dynamic> mainData) async {
    return TodoServiceDb.TODOS.refGoingPlaceCol.add({
      "ID": null,
      "TODOCATEGORY": mainData['ID'],
      "USERID": firebaseService.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "STARTDAY": serviceModel.selectStartdateTime.day,
      "STARTMONTH": serviceModel.selectStartdateTime.month,
      "STARTYEAR": serviceModel.selectStartdateTime.year,
      "ENDDAY": serviceModel.selectEnddateTime.day,
      "ENDMONTH": serviceModel.selectEnddateTime.month,
      "ENDYEAR": serviceModel.selectEnddateTime.year,
      "STARTLOCATION": serviceModel.cityStartSelect.toString(),
      "FINISHLOCATION": serviceModel.cityFinishSelect.toString(),
      "DATE": FieldValue.serverTimestamp(),
      "STATUSCHECK": false,
    }).then((value) {
      String docID = value.id;
      value.update({"ID": docID});
      serviceModel.logger.i("Seyahat Planı Kaydedildi!");
      final snackBar = SnackBar(
        content: const Text('Seyahat Planı Kaydedildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
      final snackBar = SnackBar(
        content: const Text('Seyahat Planı Oluşturulamadı!'),
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

  // study add
  Future<void> studyAdd() async {
    return TodoServiceDb.TODOS.refStudyPlaceCol.add({
      "ID": null,
      "USERID": firebaseService.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "STARTDAY": serviceModel.selectStartdateTime.day,
      "STARTMONTH": serviceModel.selectStartdateTime.month,
      "STARTYEAR": serviceModel.selectStartdateTime.year,
      "ENDDAY": serviceModel.selectEnddateTime.day,
      "ENDMONTH": serviceModel.selectEnddateTime.month,
      "ENDYEAR": serviceModel.selectEnddateTime.year,
      "DATE": FieldValue.serverTimestamp(),
      "STATUSCHECK": false,
    }).then((value) {
      String docID = value.id;
      value.update({"ID": docID});
      serviceModel.logger.i("Çalışma Planı Kaydedildi!");
      final snackBar = SnackBar(
        content: const Text('Çalışma Planı Kaydedildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
      final snackBar = SnackBar(
        content: const Text('Çalışma Planı Oluşturulamadı!'),
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

  // book add
  Future<void> bookAdd() async {
    return TodoServiceDb.TODOS.refBooksPlaceCol.add({
      "ID": null,
      "USERID": firebaseService.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "CATEGORY": serviceModel.bookCategorySelect.toString(),
      "PAGECOUNT": serviceModel.bookPageCount,
      "DATE": FieldValue.serverTimestamp(),
      "STATUSCHECK": false,
    }).then((value) {
      String docID = value.id;
      value.update({"ID": docID});
      serviceModel.logger.i("Kitap Kaydedildi!");
      final snackBar = SnackBar(
        content: const Text('Kitap Kaydedildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
      final snackBar = SnackBar(
        content: const Text('KitapOluşturulamadı!'),
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

  // shopping add
  Future<void> shoppingListAdd() async {
    return TodoServiceDb.TODOS.refShoppingPlaceCol.add({
      "ID": null,
      "USERID": firebaseService.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "CATEGORY": serviceModel.shoppingCategorySelect.toString(),
      "DATE": FieldValue.serverTimestamp(),
      "STATUSCHECK": false,
    }).then((value) {
      String docID = value.id;
      value.update({"ID": docID});
      serviceModel.logger.i("Alışveriş Listesi Kaydedildi!");
      final snackBar = SnackBar(
        content: const Text('Alışveriş Listesi Kaydedildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
      final snackBar = SnackBar(
        content: const Text('Alışveriş Listesi Oluşturulamadı!'),
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

  // healt add
  Future<void> healthAdd() async {
    return TodoServiceDb.TODOS.refHealtPlaceCol.add({
      "ID": null,
      "USERID": firebaseService.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "CATEGORY": serviceModel.healtCategorySelect.toString(),
      "GOINGDAY": serviceModel.selectdateTime.day,
      "GOINGMONTH": serviceModel.selectdateTime.month,
      "GOINGYEAR": serviceModel.selectdateTime.year,
      "DATE": FieldValue.serverTimestamp(),
      "STATUSCHECK": false,
    }).then((value) {
      String docID = value.id;
      value.update({"ID": docID});
      serviceModel.logger.i("Sağlık Planı Kaydedildi!");
      final snackBar = SnackBar(
        content: const Text('Sağlık Planı Kaydedildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
      final snackBar = SnackBar(
        content: const Text('Sağlık Planı Oluşturulamadı!'),
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

  // spor plan add
  Future<void> sporPlanAdd() async {
    return TodoServiceDb.TODOS.refSporPlaceCol.add({
      "ID": null,
      "USERID": firebaseService.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "CATEGORY": serviceModel.sportCategorySelect.toString(),
      "GOINGDAY": serviceModel.selectdateTime.day,
      "GOINGMONTH": serviceModel.selectdateTime.month,
      "GOINGYEAR": serviceModel.selectdateTime.year,
      "DATE": FieldValue.serverTimestamp(),
      "STATUSCHECK": false,
    }).then((value) {
      String docID = value.id;
      value.update({"ID": docID});
      serviceModel.logger.i("Spor Planı Kaydedildi!");
      final snackBar = SnackBar(
        content: const Text('Spor Planı Kaydedildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
      final snackBar = SnackBar(
        content: const Text('Spor Planı Oluşturulamadı!'),
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

  // movie add
  Future<void> moviePlanAdd() async {
    return TodoServiceDb.TODOS.refMoviePlaceCol.add({
      "ID": null,
      "USERID": firebaseService.userID,
      "TITLE": serviceModel.titleController.text,
      "EXPLANATION": serviceModel.explanationController.text,
      "CATEGORY": serviceModel.movieCategorySelect.toString(),
      "DATE": FieldValue.serverTimestamp(),
      "STATUSCHECK": false,
    }).then((value) {
      String docID = value.id;
      value.update({"ID": docID});
      serviceModel.logger.i("İzleme Listene Kaydedildi!");
      final snackBar = SnackBar(
        content: const Text('İzleme Listene Kaydedildi'),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      serviceModel.titleController.clear();
      serviceModel.explanationController.clear();
    }).catchError((err) {
      serviceModel.logger.e("Hata: $err");
      final snackBar = SnackBar(
        content: const Text('İzleme Listene Oluşturulamadı!'),
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

  // // query control
  // void todoListQueryControl(Map<String, dynamic> data) async {
  //   if (data['ID'] == "0qXiPbGgtwu3j1r5j5Lz") {
  //     TodoServiceDb.TODOS.stTodoMeetingCol;
  //   } else if (data['ID'] == "GMwLSlyI6e2fY1N8JsLQ") {
  //     TodoServiceDb.TODOS.stTodoPlacesToGoCol;
  //   } else if (data['ID'] == "QqqKN0VbdWfofliUtDm6") {
  //     TodoServiceDb.TODOS.stTodoStudyCol;
  //   } else if (data['ID'] == "RjFvWQe3dpW34QAxX2v7") {
  //     TodoServiceDb.TODOS.stTodoBooksCol;
  //   } else if (data['ID'] == "SXrN07acJwhryUdzVwIQ") {
  //     TodoServiceDb.TODOS.stTodoShopCol;
  //   } else if (data['ID'] == "ZaqqOF15uH11kMv0vdHu") {
  //     TodoServiceDb.TODOS.stTodoHealthCol;
  //   } else if (data['ID'] == "fYGlLPTeMpPCYfirfleu") {
  //     TodoServiceDb.TODOS.stTodoSportCol;
  //   } else if (data['ID'] == "wNtyPEvvFYoWjI36TSJy") {
  //     TodoServiceDb.TODOS.stTodoMovieCol;
  //   }
  // }

  // check status todo
  void checkStatusChange(bool? value, Map<String, dynamic> data,
      Map<String, dynamic> mainData) async {
    setState(() {
      data['STATUSCHECK'] = value!;
    });
    if (mainData['ID'] == "0qXiPbGgtwu3j1r5j5Lz") {
      return await TodoServiceDb.TODOS.refMeetingCol.doc(data['ID']).update({
        "STATUSCHECK": value,
      }).then((value) {
        serviceModel.logger.i("İşaretlendi");
      }).catchError((err) {
        serviceModel.logger.e("Hata");
      });
    } else if (mainData['ID'] == "GMwLSlyI6e2fY1N8JsLQ") {
      return await TodoServiceDb.TODOS.refGoingPlaceCol.doc(data['ID']).update({
        "STATUSCHECK": value,
      }).then((value) {
        serviceModel.logger.i("İşaretlendi");
      }).catchError((err) {
        serviceModel.logger.e("Hata");
      });
    } else if (mainData['ID'] == "QqqKN0VbdWfofliUtDm6") {
      return await TodoServiceDb.TODOS.refStudyPlaceCol.doc(data['ID']).update({
        "STATUSCHECK": value,
      }).then((value) {
        serviceModel.logger.i("İşaretlendi");
      }).catchError((err) {
        serviceModel.logger.e("Hata");
      });
    } else if (mainData['ID'] == "RjFvWQe3dpW34QAxX2v7") {
      return await TodoServiceDb.TODOS.refBooksPlaceCol.doc(data['ID']).update({
        "STATUSCHECK": value,
      }).then((value) {
        serviceModel.logger.i("İşaretlendi");
      }).catchError((err) {
        serviceModel.logger.e("Hata");
      });
    } else if (mainData['ID'] == "SXrN07acJwhryUdzVwIQ") {
      return await TodoServiceDb.TODOS.refShoppingPlaceCol
          .doc(data['ID'])
          .update({
        "STATUSCHECK": value,
      }).then((value) {
        serviceModel.logger.i("İşaretlendi");
      }).catchError((err) {
        serviceModel.logger.e("Hata");
      });
    } else if (mainData['ID'] == "ZaqqOF15uH11kMv0vdHu") {
      return await TodoServiceDb.TODOS.refHealtPlaceCol.doc(data['ID']).update({
        "STATUSCHECK": value,
      }).then((value) {
        serviceModel.logger.i("İşaretlendi");
      }).catchError((err) {
        serviceModel.logger.e("Hata");
      });
    } else if (mainData['ID'] == "fYGlLPTeMpPCYfirfleu") {
      return await TodoServiceDb.TODOS.refSporPlaceCol.doc(data['ID']).update({
        "STATUSCHECK": value,
      }).then((value) {
        serviceModel.logger.i("İşaretlendi");
      }).catchError((err) {
        serviceModel.logger.e("Hata");
      });
    } else if (mainData['ID'] == "wNtyPEvvFYoWjI36TSJy") {
      return await TodoServiceDb.TODOS.refMoviePlaceCol.doc(data['ID']).update({
        "STATUSCHECK": value,
      }).then((value) {
        serviceModel.logger.i("İşaretlendi");
      }).catchError((err) {
        serviceModel.logger.e("Hata");
      });
    }
  }

  // todo favorite add
  Future<void> todoFavoriteAdd(
      Map<String, dynamic> data, Map<String, dynamic> mainData) async {
    return await TodoServiceDb.FAVORITE.refFavoCol.doc(data['ID']).set({
      "USERID": firebaseService.userID,
      "TODOID": data['ID'],
      "CATEGORYID": mainData['ID'],
      "DATE": FieldValue.serverTimestamp(),
    }).then((value) {
      serviceModel.logger.i("Favorilere Eklendi");
    }).catchError((err) {
      serviceModel.logger.e("Hata Oluştu");
    });
  }

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
  Future<void> todoImportantAdd(
      Map<String, dynamic> data, Map<String, dynamic> mainData) async {
    return await TodoServiceDb.IMPORTANT.refImportantCol.doc(data['ID']).set({
      "USERID": firebaseService.userID,
      "TODOID": data['ID'],
      "CATEGORYID": mainData['ID'],
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
    } else if (mainData['ID'] == "GMwLSlyI6e2fY1N8JsLQ") {
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
