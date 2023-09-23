import 'package:flutter/material.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/todocategory/todocategory.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// database
import 'package:mytodo/product/utility/firebase/database/home_db/homedb.dart';
import 'package:mytodo/product/utility/firebase/database/todo_db/todo_db.dart';

// widget
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

// pub dev
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    required this.maxWidth,
    required this.dynamicWidth,
    required this.dynamicHeight,
  });
  final dynamic maxWidth;
  final dynamic dynamicWidth;
  final dynamic dynamicHeight;
  @override
  Widget build(BuildContext context) {
    Future<int> getDocumentCount(Map<String, dynamic> data) async {
      if (data['ID'] == "0qXiPbGgtwu3j1r5j5Lz") {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refMeetingCol.get();
        return querySnapshot.size;
      } else if (data['ID'] == "GMwLSlyI6e2fY1N8JsLQ") {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refGoingPlaceCol.get();
        return querySnapshot.size;
      } else if (data['ID'] == "QqqKN0VbdWfofliUtDm6") {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refStudyPlaceCol.get();
        return querySnapshot.size;
      } else if (data['ID'] == "RjFvWQe3dpW34QAxX2v7") {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refBooksPlaceCol.get();
        return querySnapshot.size;
      } else if (data['ID'] == "SXrN07acJwhryUdzVwIQ") {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refShoppingPlaceCol.get();
        return querySnapshot.size;
      } else if (data['ID'] == "ZaqqOF15uH11kMv0vdHu") {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refHealtPlaceCol.get();
        return querySnapshot.size;
      } else if (data['ID'] == "fYGlLPTeMpPCYfirfleu") {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refSporPlaceCol.get();
        return querySnapshot.size;
      } else if (data['ID'] == "wNtyPEvvFYoWjI36TSJy") {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refMoviePlaceCol.get();
        return querySnapshot.size;
      } else {
        QuerySnapshot querySnapshot =
            await TodoServiceDb.TODOS.refMoviePlaceCol.get();
        return querySnapshot.size;
      }
    }

    return buildListWidget(context, getDocumentCount);
  }

  Widget buildListWidget(BuildContext context, getDocumentCount) => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.20),
          child: StreamBuilder<QuerySnapshot>(
            stream: HomeServiceDb.CATEGORYS.refTodoCategoryCol,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const SizedBox();
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              }

              return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  TodoCategoryView(
                            data: data,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0); // Sağdan başla
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: dynamicWidth(0.45),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              // top
                              Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: ColorBackgroundConstant.purpleDarker
                                      .withOpacity(0.3),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // icon
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 5),
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color:
                                                  ColorBackgroundConstant.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(4),
                                              ),
                                            ),
                                            child: Image.network(
                                                data['ICON'].toString())),
                                      ),
                                      // category
                                      TitleMediumWhiteText(
                                        textAlign: TextAlign.center,
                                        text: data['TODO'].toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // footer
                              FutureBuilder<int>(
                                future: getDocumentCount(data),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const SizedBox();
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    double documentCountPercentage =
                                        (snapshot.data ?? 0) / 100.0;

                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: LinearPercentIndicator(
                                        width: dynamicWidth(0.45),
                                        lineHeight: 14.0,
                                        percent: documentCountPercentage,
                                        backgroundColor: Colors.grey,
                                        animation: true,
                                        progressColor: ColorBackgroundConstant
                                            .purplePrimary,
                                      ),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      );
}
