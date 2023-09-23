import 'package:flutter/material.dart';

// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';

// view router
import 'package:mytodo/feature/bottommenu/view/todocategory/view/tododetails/tododetails.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// base
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';

// database
import 'package:mytodo/product/utility/firebase/database/todo_db/todo_db.dart';

// widget
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
            onChanged: (bool? value) {
              checkStatusChange(value, widget.data, widget.mainData);
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
