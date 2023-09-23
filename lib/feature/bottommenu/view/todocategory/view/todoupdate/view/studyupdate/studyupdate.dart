import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/studyupdate/widget/titlesubtitle_widget.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// base
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class StudyUpdateView extends StatefulWidget {
  const StudyUpdateView(
      {super.key, required this.data, required this.mainData});
  final Map<String, dynamic> data;
  final Map<String, dynamic> mainData;
  @override
  State<StudyUpdateView> createState() => _StudyUpdateViewState();
}

class _StudyUpdateViewState extends MainTodoBase<StudyUpdateView> {
  late TextEditingController title = TextEditingController(
    text: widget.mainData['TITLE'],
  );

  late TextEditingController explanation = TextEditingController(
    text: widget.mainData['EXPLANATION'],
  );

  late DateTime startDate = DateTime(widget.mainData['STARTYEAR'],
      widget.mainData['STARTMONTH'], widget.mainData['STARTDAY']);

  late DateTime finishDate = DateTime(widget.mainData['ENDYEAR'],
      widget.mainData['ENDMONTH'], widget.mainData['ENDDAY']);
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
          "Ders Çalışma Planı Güncelle",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
      ),
      body: Form(
        key: serviceModel.formStudyAddKey,
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
              // study start/end date
              buildStudyDateWidget,
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

  // study start/end date
  Widget get buildStudyDateWidget => Row(
        children: <Widget>[
          // start date
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: maxWidth,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: LabelMediumGreyBoldText(
                      textAlign: TextAlign.left,
                      text: StringTodoConstants.studyCreaeStartDate,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: startDate,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                      helpText: "Başlangıç Tarihi",
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
                        startDate = dateTime;
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
                            "${startDate.day}.${startDate.month}.${startDate.year}",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // end date
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: maxWidth,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: LabelMediumGreyBoldText(
                      textAlign: TextAlign.left,
                      text: StringTodoConstants.studyCreaeEndDate,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: finishDate,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                      helpText: "Bitiş Tarihi",
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
                        finishDate = dateTime;
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
                            "${finishDate.day}.${finishDate.month}.${finishDate.year}",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );

  // button
  Widget get // button
      buildButtonWidget => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                if (serviceModel.formStudyAddKey.currentState!.validate()) {
                  studyUpdate(widget.mainData, title, explanation, startDate,
                      finishDate);
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
