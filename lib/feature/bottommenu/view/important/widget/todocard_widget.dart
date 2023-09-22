import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/feature/bottommenu/view/favrority/view/tododetails/tododetails.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/utility/base/important_base/important_base.dart';
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';
import 'package:mytodo/product/utility/firebase/database/todo_db/todo_db.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key, required this.data, required this.mainData});
  final Map<String, dynamic> data;
  final Map<String, dynamic> mainData;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends MainTodoBase<TodoCard> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return ColorBackgroundConstant.purplePrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 15),
        child: ListTile(
          leading: Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: widget.data['STATUSCHECK'],
            onChanged: (bool? value) async {
              serviceModel.logger.i("Tıklandı");
              setState(() {
                widget.data['STATUSCHECK'] = value!;
              });
              if (widget.mainData['CATEGORYID'] == "0qXiPbGgtwu3j1r5j5Lz") {
                return await TodoServiceDb.TODOS.refMeetingCol
                    .doc(widget.data['ID'])
                    .update({
                  "STATUSCHECK": value,
                }).then((value) {
                  serviceModel.logger.i("İşaretlendi");
                }).catchError((err) {
                  serviceModel.logger.e("Hata");
                });
              } else if (widget.mainData['CATEGORYID'] ==
                  "GMwLSlyI6e2fY1N8JsLQ") {
                return await TodoServiceDb.TODOS.refGoingPlaceCol
                    .doc(widget.data['ID'])
                    .update({
                  "STATUSCHECK": value,
                }).then((value) {
                  serviceModel.logger.i("İşaretlendi");
                }).catchError((err) {
                  serviceModel.logger.e("Hata");
                });
              } else if (widget.mainData['CATEGORYID'] ==
                  "QqqKN0VbdWfofliUtDm6") {
                return await TodoServiceDb.TODOS.refStudyPlaceCol
                    .doc(widget.data['ID'])
                    .update({
                  "STATUSCHECK": value,
                }).then((value) {
                  serviceModel.logger.i("İşaretlendi");
                }).catchError((err) {
                  serviceModel.logger.e("Hata");
                });
              } else if (widget.mainData['CATEGORYID'] ==
                  "RjFvWQe3dpW34QAxX2v7") {
                return await TodoServiceDb.TODOS.refBooksPlaceCol
                    .doc(widget.data['ID'])
                    .update({
                  "STATUSCHECK": value,
                }).then((value) {
                  serviceModel.logger.i("İşaretlendi");
                }).catchError((err) {
                  serviceModel.logger.e("Hata");
                });
              } else if (widget.mainData['CATEGORYID'] ==
                  "SXrN07acJwhryUdzVwIQ") {
                return await TodoServiceDb.TODOS.refShoppingPlaceCol
                    .doc(widget.data['ID'])
                    .update({
                  "STATUSCHECK": value,
                }).then((value) {
                  serviceModel.logger.i("İşaretlendi");
                }).catchError((err) {
                  serviceModel.logger.e("Hata");
                });
              } else if (widget.mainData['CATEGORYID'] ==
                  "ZaqqOF15uH11kMv0vdHu") {
                return await TodoServiceDb.TODOS.refHealtPlaceCol
                    .doc(widget.data['ID'])
                    .update({
                  "STATUSCHECK": value,
                }).then((value) {
                  serviceModel.logger.i("İşaretlendi");
                }).catchError((err) {
                  serviceModel.logger.e("Hata");
                });
              } else if (widget.mainData['CATEGORYID'] ==
                  "fYGlLPTeMpPCYfirfleu") {
                return await TodoServiceDb.TODOS.refSporPlaceCol
                    .doc(widget.data['ID'])
                    .update({
                  "STATUSCHECK": value,
                }).then((value) {
                  serviceModel.logger.i("İşaretlendi");
                }).catchError((err) {
                  serviceModel.logger.e("Hata");
                });
              } else if (widget.mainData['CATEGORYID'] ==
                  "wNtyPEvvFYoWjI36TSJy") {
                return await TodoServiceDb.TODOS.refMoviePlaceCol
                    .doc(widget.data['ID'])
                    .update({
                  "STATUSCHECK": value,
                }).then((value) {
                  serviceModel.logger.i("İşaretlendi");
                }).catchError((err) {
                  serviceModel.logger.e("Hata");
                });
              }
            },
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoDetailsView(
                    data: widget.data,
                    mainData: widget.mainData,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    dynamicHeight: dynamicHeight,
                  ),
                ),
              );
            },
            child: LabelMediumBlackBoldText(
              text: widget.data['TITLE'],
              textAlign: TextAlign.left,
            ),
          ),
          subtitle: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoDetailsView(
                    data: widget.data,
                    mainData: widget.mainData,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    dynamicHeight: dynamicHeight,
                  ),
                ),
              );
            },
            child: LabelMediumGreyText(
              text: widget.data['EXPLANATION'].toString(),
              textAlign: TextAlign.left,
            ),
          ),
          trailing: FutureBuilder<DocumentSnapshot>(
            future:
                TodoServiceDb.FAVORITE.refFavoCol.doc(widget.data['ID']).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const SizedBox();
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return GestureDetector(
                  onTap: () {
                    todoFavoriteAdd(widget.data, widget.mainData);
                    setState(() {
                      serviceModel.isFavoriteButtonStatus = false;
                    });
                  },
                  child: const Icon(
                    Icons.star_outline,
                    color: Colors.yellow,
                    size: 24,
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> dataFavo =
                    snapshot.data!.data() as Map<String, dynamic>;
                return serviceModel.isFavoriteButtonStatus == false
                    ? GestureDetector(
                        onTap: () {
                          todoFavoriteDelete(widget.data);
                          setState(() {
                            serviceModel.isFavoriteButtonStatus = true;
                          });
                        },
                        child: const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 24,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          todoFavoriteAdd(widget.data, widget.mainData);
                          setState(() {
                            serviceModel.isFavoriteButtonStatus = false;
                          });
                        },
                        child: const Icon(
                          Icons.star_outline,
                          color: Colors.yellow,
                          size: 24,
                        ),
                      );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
