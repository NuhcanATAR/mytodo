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

  // date picker
  // ignore: non_constant_identifier_names
  void ShowDatePickerDialog() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: serviceModel.selectdateTime,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      helpText: "Toplantı Tarihi",
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
      helpText: "Gidiş Tarihi",
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
      helpText: "Dönüş Tarihi",
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
}
