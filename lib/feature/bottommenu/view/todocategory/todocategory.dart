import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/todocreate.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/widget/notodo_view.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/widget/todocard_widget.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/widget/todoerror_view.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/widget/todoloading_view.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// database
import 'package:mytodo/product/utility/firebase/database/todo_db/todo_db.dart';

// base
import '../../../../product/utility/base/todo_base/todo_base.dart';

class TodoCategoryView extends StatefulWidget {
  const TodoCategoryView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<TodoCategoryView> createState() => _TodoCategoryViewState();
}

class _TodoCategoryViewState extends MainTodoBase<TodoCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.purplePrimary,
            size: 21,
          ),
        ),
        title: Text(
          widget.data['TODO'].toString(),
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoCreateView(
                      data: widget.data,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: ColorBackgroundConstant.purplePrimary,
                size: 21,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: context.padding.normal,
        child: StreamBuilder<QuerySnapshot>(
          stream: widget.data['ID'] == "0qXiPbGgtwu3j1r5j5Lz"
              ? TodoServiceDb.TODOS.stTodoMeetingCol
              : widget.data['ID'] == "GMwLSlyI6e2fY1N8JsLQ"
                  ? TodoServiceDb.TODOS.stTodoPlacesToGoCol
                  : widget.data['ID'] == "QqqKN0VbdWfofliUtDm6"
                      ? TodoServiceDb.TODOS.stTodoStudyCol
                      : widget.data['ID'] == "RjFvWQe3dpW34QAxX2v7"
                          ? TodoServiceDb.TODOS.stTodoBooksCol
                          : widget.data['ID'] == "SXrN07acJwhryUdzVwIQ"
                              ? TodoServiceDb.TODOS.stTodoShopCol
                              : widget.data['ID'] == "ZaqqOF15uH11kMv0vdHu"
                                  ? TodoServiceDb.TODOS.stTodoHealthCol
                                  : widget.data['ID'] == "fYGlLPTeMpPCYfirfleu"
                                      ? TodoServiceDb.TODOS.stTodoSportCol
                                      : TodoServiceDb.TODOS.stTodoMovieCol,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const TodoErrorView();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const TodoLoadingView();
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> dataTodo =
                      document.data()! as Map<String, dynamic>;
                  return TodoCard(
                    data: dataTodo,
                    mainData: widget.data,
                  );
                }).toList(),
              );
            } else {
              return const NoTodoView();
            }
          },
        ),
      ),
    );
  }
}
