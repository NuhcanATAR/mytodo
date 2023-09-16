import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class CalendarListWidget extends StatelessWidget {
  const CalendarListWidget({
    Key? key,
    required this.maxWidth,
    required this.dynamicWidth,
    required this.dynamicHeight,
    required this.nextDays,
    required this.day,
  }) : super(key: key);

  final dynamic maxWidth;
  final dynamic dynamicWidth;
  final dynamic dynamicHeight;
  final List<DateTime> nextDays;
  final int day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      height: dynamicHeight(0.15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nextDays.length,
        itemBuilder: (context, index) {
          return DateBoxWidget(
            date: nextDays[index],
            maxWidth: maxWidth,
            dynamicWidth: dynamicWidth,
            dynamicHeight: dynamicHeight,
            day: day,
          );
        },
      ),
    );
  }
}

class DateBoxWidget extends StatelessWidget {
  const DateBoxWidget({
    Key? key,
    required this.maxWidth,
    required this.dynamicWidth,
    required this.dynamicHeight,
    required this.date,
    required this.day,
  }) : super(key: key);

  final dynamic maxWidth;
  final dynamic dynamicWidth;
  final dynamic dynamicHeight;
  final DateTime date;
  final int day;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final formattedDate = DateFormat('dd.MM.yyyy').format(date);

    return SizedBox(
      width: dynamicWidth(0.22),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: date.day == day
              ? ColorBackgroundConstant.purplePrimary
              : ColorBackgroundConstant.purplePrimary.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              4,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              date.day == day
                  ? LabelMediumWhiteText(
                      text: DateFormat('E', 'tr_TR').format(date),
                      textAlign: TextAlign.center,
                    )
                  : LabelMediumBlackBoldText(
                      text: DateFormat('E', 'tr_TR').format(date),
                      textAlign: TextAlign.center,
                    ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(124),
                  ),
                ),
                child: TitleMediumBlackGreyBoldText(
                  text: date.day.toString(),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
