import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/meetingupdate/widget/titlesubtitle_widget.dart';

import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class MeetingUpdateView extends StatefulWidget {
  const MeetingUpdateView(
      {super.key, required this.data, required this.mainData});
  final Map<String, dynamic> data;
  final Map<String, dynamic> mainData;

  @override
  State<MeetingUpdateView> createState() => _MeetingUpdateViewState();
}

class _MeetingUpdateViewState extends MainTodoBase<MeetingUpdateView> {
  late TextEditingController title = TextEditingController(
    text: widget.mainData['TITLE'],
  );
  late TextEditingController explanation = TextEditingController(
    text: widget.mainData['EXPLANATION'],
  );

  late DateTime meetingDate = DateTime(
    widget.mainData['YEAR'],
    widget.mainData['MONTH'],
    widget.mainData['DAY'],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Toplantı Güncelle",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
      ),
      body: Form(
        key: serviceModel.formMettingAddKey,
        child: Padding(
          padding: context.padding.normal,
          child: ListView(
            children: <Widget>[
              // title sub title widget
              buildTitleSubTitleWidget,
              // title input
              buildTitleinputWidget,
              // explanation input
              buildExplanationWidget,
              // metting date
              buildMeetingDateWidget,
              // button
              buildButtonWidget,
            ],
          ),
        ),
      ),
    );
  }

  // title sub title widget
  Widget get buildTitleSubTitleWidget =>
      TitleSubTitleWidget(maxWidth: maxWidth);

  // title input
  Widget get buildTitleinputWidget => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: TextFormField(
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: ColorTextConstant.blackGrey,
            ),
          ),
          controller: title,
          validator: serviceModel.titleValidator,
          onTap: () {
            setState(() {
              serviceModel.inputBorder = true;
            });
          },
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: serviceModel.inputBorder == false
                    ? Colors.transparent
                    : ColorBackgroundConstant.purplePrimary,
                width: 1,
              ),
            ),
            filled: true,
            hintText: "Başlık *",
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: ColorTextConstant.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  // explanation input
  Widget get buildExplanationWidget => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: TextFormField(
          minLines: 4,
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: ColorTextConstant.blackGrey,
            ),
          ),
          controller: explanation,
          onTap: () {
            setState(() {
              serviceModel.inputBorder = true;
            });
          },
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: serviceModel.inputBorder == false
                    ? Colors.transparent
                    : ColorBackgroundConstant.purplePrimary,
                width: 1,
              ),
            ),
            filled: true,
            hintText: "Açıklama *",
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: ColorTextConstant.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  // metting date
  Widget get buildMeetingDateWidget => Column(
        children: <Widget>[
          SizedBox(
            width: maxWidth,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: LabelMediumGreyBoldText(
                textAlign: TextAlign.left,
                text: StringTodoConstants.datePickerText,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: meetingDate,
                firstDate: DateTime(2023),
                lastDate: DateTime(2025),
                helpText: "Tarih",
                confirmText: "Tamam",
                cancelText: "Kapat",
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme.light(
                        primary: ColorBackgroundConstant.purplePrimary,
                        onPrimary: Colors.white,
                        surface: Colors.white,
                        onSurface: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (dateTime != null) {
                setState(() {
                  meetingDate = dateTime;
                });
              }
            },
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.date_range,
                  color: Colors.grey,
                  size: 21,
                ),
                const SizedBox(
                  width: 5,
                ),
                LabelMediumGreyBoldText(
                  textAlign: TextAlign.left,
                  text:
                      "${meetingDate.day}.${meetingDate.month}.${meetingDate.year}",
                ),
              ],
            ),
          )
        ],
      );

  // button
  Widget get // button
      buildButtonWidget => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                if (serviceModel.formMettingAddKey.currentState!.validate()) {
                  meetinUpdate(
                      widget.mainData, title, explanation, meetingDate);
                }
              },
              child: SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.08),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorBackgroundConstant.purplePrimary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const LabelMediumWhiteText(
                    text: StringTodoConstants.updateBtnText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
}
