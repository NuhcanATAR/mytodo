import 'package:flutter/material.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/bookscreate/bookscreate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/goingplacecreate/goingplacecreate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/healthcreate/healthcreate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/meetingcreate/meetingcreate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/moviecreate/moviecreate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/shoppingcreate/shoppingcreate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/studycreate/studycreate.dart';
import 'view/sportcreate/sportcreate.dart';

class TodoCreateView extends StatefulWidget {
  const TodoCreateView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<TodoCreateView> createState() => _TodoCreateViewState();
}

class _TodoCreateViewState extends State<TodoCreateView> {
  @override
  Widget build(BuildContext context) {
    if (widget.data['ID'] == "0qXiPbGgtwu3j1r5j5Lz") {
      return MeetingCreateView(data: widget.data);
    } else if (widget.data['ID'] == "GMwLSlyI6e2fY1N8JsLQ") {
      return GoingPlaceCreateView(data: widget.data);
    } else if (widget.data['ID'] == "QqqKN0VbdWfofliUtDm6") {
      return StudyCreateView(data: widget.data);
    } else if (widget.data['ID'] == "RjFvWQe3dpW34QAxX2v7") {
      return BooksCreateView(data: widget.data);
    } else if (widget.data['ID'] == "SXrN07acJwhryUdzVwIQ") {
      return ShoppingListCreateView(data: widget.data);
    } else if (widget.data['ID'] == "ZaqqOF15uH11kMv0vdHu") {
      return HealthCreateView(data: widget.data);
    } else if (widget.data['ID'] == "fYGlLPTeMpPCYfirfleu") {
      return SportCreateView(data: widget.data);
    } else if (widget.data['ID'] == "wNtyPEvvFYoWjI36TSJy") {
      return MovieCreateView(data: widget.data);
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("adasd"),
        ),
      );
    }
  }
}
