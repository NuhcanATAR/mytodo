import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/bottommenu/view/favrority/widget/todocard_widget.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/utility/base/favority_base/favority_base.dart';
import 'package:mytodo/product/utility/firebase/database/favority_db/favority_db.dart';
import 'package:mytodo/product/utility/firebase/database/todo_db/todo_db.dart';

class FavorityView extends StatefulWidget {
  const FavorityView({super.key});

  @override
  State<FavorityView> createState() => _FavorityViewState();
}

class _FavorityViewState extends MainFavorityBase<FavorityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Favoriler",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorTextConstant.mainColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: context.padding.normal,
        child: StreamBuilder<QuerySnapshot>(
          stream: FavorityServiceDb.FAVORITE.stFavorityCol,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const SizedBox();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return FutureBuilder<DocumentSnapshot>(
                    future: data['CATEGORYID'] == "0qXiPbGgtwu3j1r5j5Lz"
                        ? TodoServiceDb.TODOS.refMeetingCol
                            .doc(data['TODOID'])
                            .get()
                        : data['CATEGORYID'] == "GMwLSlyI6e2fY1N8JsLQ"
                            ? TodoServiceDb.TODOS.refGoingPlaceCol
                                .doc(data['TODOID'])
                                .get()
                            : data['CATEGORYID'] == "QqqKN0VbdWfofliUtDm6"
                                ? TodoServiceDb.TODOS.refStudyPlaceCol
                                    .doc(data['TODOID'])
                                    .get()
                                : data['CATEGORYID'] == "RjFvWQe3dpW34QAxX2v7"
                                    ? TodoServiceDb.TODOS.refBooksPlaceCol
                                        .doc(data['TODOID'])
                                        .get()
                                    : data['CATEGORYID'] ==
                                            "SXrN07acJwhryUdzVwIQ"
                                        ? TodoServiceDb
                                            .TODOS.refShoppingPlaceCol
                                            .doc(data['TODOID'])
                                            .get()
                                        : data['CATEGORYID'] ==
                                                "ZaqqOF15uH11kMv0vdHu"
                                            ? TodoServiceDb
                                                .TODOS.refHealtPlaceCol
                                                .doc(data['TODOID'])
                                                .get()
                                            : data['CATEGORYID'] ==
                                                    "fYGlLPTeMpPCYfirfleu"
                                                ? TodoServiceDb
                                                    .TODOS.refSporPlaceCol
                                                    .doc(data['TODOID'])
                                                    .get()
                                                : data['CATEGORYID'] ==
                                                        "fYGlLPTeMpPCYfirfleu"
                                                    ? TodoServiceDb
                                                        .TODOS.refMoviePlaceCol
                                                        .doc(data['TODOID'])
                                                        .get()
                                                    : FirebaseFirestore.instance
                                                        .collection("USERS")
                                                        .doc("adsas")
                                                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox();
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return const SizedBox();
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> dataFavo =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return TodoCard(data: dataFavo, mainData: data);
                      }

                      return const SizedBox();
                    },
                  );
                }).toList(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
