import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/studycreate/widget/titlesubtitle_widget.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class StudyCreateView extends StatefulWidget {
  const StudyCreateView({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<StudyCreateView> createState() => _StudyCreateViewState();
}

class _StudyCreateViewState extends MainTodoBase<StudyCreateView> {
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
          "Ders Çalışma Oluştur",
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
          controller: serviceModel.titleController,
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
          controller: serviceModel.explanationController,
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
                  onTap: () {
                    ShowDateStartPickerDialog();
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
                            "${serviceModel.selectStartdateTime.day}.${serviceModel.selectStartdateTime.month}.${serviceModel.selectStartdateTime.year}",
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
                  onTap: () {
                    ShowDateEndPickerDialog();
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
                            "${serviceModel.selectEnddateTime.day}.${serviceModel.selectEnddateTime.month}.${serviceModel.selectEnddateTime.year}",
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
                  studyAdd();
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
                    text: StringTodoConstants.button,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
}
