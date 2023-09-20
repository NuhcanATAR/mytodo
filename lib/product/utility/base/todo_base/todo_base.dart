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
      "DAY": serviceModel.selectdateTime.day.toString(),
      "MONTH": serviceModel.selectdateTime.month.toString(),
      "YEAR": serviceModel.selectdateTime.year.toString(),
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
  Future<void> goingPlaceAdd() async {
    return TodoServiceDb.TODOS.refGoingPlaceCol.add({
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
      "PAGECOUNT": serviceModel.bookPageCount.toString(),
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
      "GOINGDAY": serviceModel.selectdateTime.day.toString(),
      "GOINGMONTH": serviceModel.selectdateTime.month.toString(),
      "GOINGYEAR": serviceModel.selectdateTime.year.toString(),
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
      "GOINGDAY": serviceModel.selectdateTime.day.toString(),
      "GOINGMONTH": serviceModel.selectdateTime.month.toString(),
      "GOINGYEAR": serviceModel.selectdateTime.year.toString(),
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

  // query control
  void todoListQueryControl(Map<String, dynamic> data) async {
    if (data['ID'] == "0qXiPbGgtwu3j1r5j5Lz") {
      TodoServiceDb.TODOS.stTodoMeetingCol;
    } else if (data['ID'] == "GMwLSlyI6e2fY1N8JsLQ") {
      TodoServiceDb.TODOS.stTodoPlacesToGoCol;
    } else if (data['ID'] == "QqqKN0VbdWfofliUtDm6") {
      TodoServiceDb.TODOS.stTodoStudyCol;
    } else if (data['ID'] == "RjFvWQe3dpW34QAxX2v7") {
      TodoServiceDb.TODOS.stTodoBooksCol;
    } else if (data['ID'] == "SXrN07acJwhryUdzVwIQ") {
      TodoServiceDb.TODOS.stTodoShopCol;
    } else if (data['ID'] == "ZaqqOF15uH11kMv0vdHu") {
      TodoServiceDb.TODOS.stTodoHealthCol;
    } else if (data['ID'] == "fYGlLPTeMpPCYfirfleu") {
      TodoServiceDb.TODOS.stTodoSportCol;
    } else if (data['ID'] == "wNtyPEvvFYoWjI36TSJy") {
      TodoServiceDb.TODOS.stTodoMovieCol;
    }
  }
}
