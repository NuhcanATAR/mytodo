import 'package:flutter/material.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/booksupdate/booksupdate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/goingplaceupdate/goingplaceupdate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/healthupdate/healthupdate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/meetingupdate/meetingupdate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/movieupdate/movieupdate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/shoppingupdate/shoppingupdate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/studyupdate/studyupdate.dart';
import 'view/sportupdate/sportupdate.dart';

class TodoUpdateView extends StatefulWidget {
  const TodoUpdateView({super.key, required this.data, required this.mainData});
  final Map<String, dynamic> data;
  final Map<String, dynamic> mainData;

  @override
  State<TodoUpdateView> createState() => _TodoUpdateViewState();
}

class _TodoUpdateViewState extends State<TodoUpdateView> {
  @override
  Widget build(BuildContext context) {
    if (widget.data['ID'] == "0qXiPbGgtwu3j1r5j5Lz") {
      return MeetingUpdateView(
        data: widget.data,
        mainData: widget.mainData,
      );
    } else if (widget.data['ID'] == "GMwLSlyI6e2fY1N8JsLQ") {
      return GoingPlaceUpdateView(
        data: widget.data,
        mainData: widget.mainData,
      );
    } else if (widget.data['ID'] == "QqqKN0VbdWfofliUtDm6") {
      return StudyUpdateView(
        data: widget.data,
        mainData: widget.mainData,
      );
    } else if (widget.data['ID'] == "RjFvWQe3dpW34QAxX2v7") {
      return BooksUpdateView(
        data: widget.data,
        mainData: widget.mainData,
      );
    } else if (widget.data['ID'] == "SXrN07acJwhryUdzVwIQ") {
      return ShoppingListUpdateView(
        data: widget.data,
        mainData: widget.mainData,
      );
    } else if (widget.data['ID'] == "ZaqqOF15uH11kMv0vdHu") {
      return HealthUpdateView(
        data: widget.data,
        maindata: widget.mainData,
      );
    } else if (widget.data['ID'] == "fYGlLPTeMpPCYfirfleu") {
      return SportUpdateView(
        data: widget.data,
        mainData: widget.mainData,
      );
    } else if (widget.data['ID'] == "wNtyPEvvFYoWjI36TSJy") {
      return MovieUpdateView(
        data: widget.data,
        mainData: widget.mainData,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("adasd"),
        ),
      );
    }
  }
}
