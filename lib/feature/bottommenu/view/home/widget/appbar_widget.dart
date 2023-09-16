import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/utility/firebase/database/home_db/homedb.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.dynamicWidth,
    required this.dynamicHeight,
    required this.maxwidth,
    required this.day,
    required this.month,
    required this.year,
    required this.hour,
  });
  final dynamic dynamicWidth;
  final dynamic dynamicHeight;
  final dynamic maxwidth;
  final int day;
  final int month;
  final int year;
  final int hour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // date & title
          buildDateTitleWidget(context),
          // profile img
          buildProfileimgWidget(context),
        ],
      ),
    );
  }

  // date & title
  Widget buildDateTitleWidget(context) => Expanded(
          child: Column(
        children: <Widget>[
          // date
          SizedBox(
            width: maxwidth,
            child: LabelMediumGreyText(
              text: "$day.$month.$year",
              textAlign: TextAlign.left,
            ),
          ),
          // title
          SizedBox(
            width: maxwidth,
            child: FutureBuilder<DocumentSnapshot>(
              future: HomeServiceDb.USERS.refCol,
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const TitleMediumBlackBoldText(
                    text: "",
                    textAlign: TextAlign.left,
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return TitleMediumBlackBoldText(
                    text:
                        "${hour < 12 ? 'Günaydın' : hour < 18 ? 'Merhaba' : 'İyiakşamlar'}, ${data['NAME'].toString()} ${data['SURNAME'].toString()} hadi\n planları gözden geçirelim!",
                    textAlign: TextAlign.left,
                  );
                } else {
                  return const TitleMediumBlackBoldText(
                    text: "",
                    textAlign: TextAlign.left,
                  );
                }
              },
            ),
          ),
        ],
      ));
  // profile img
  Widget buildProfileimgWidget(context) => SizedBox(
        width: dynamicWidth(0.11),
        height: dynamicHeight(0.05),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImgIMGConstant.appHomeAccountImg.toPng6),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(124),
            ),
          ),
        ),
      );
}
