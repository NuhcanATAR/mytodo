import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/todocategory.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/utility/firebase/database/home_db/homedb.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
    return buildListWidget(context);
  }

  Widget buildListWidget(BuildContext context) => Padding(
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
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: LinearPercentIndicator(
                                  width: dynamicWidth(0.45),
                                  lineHeight: 14.0,
                                  percent: 0.4,
                                  backgroundColor: Colors.grey,
                                  animation: true,
                                  progressColor:
                                      ColorBackgroundConstant.purplePrimary,
                                ),
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
