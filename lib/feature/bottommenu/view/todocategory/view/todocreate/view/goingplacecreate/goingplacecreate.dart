import 'package:flutter/material.dart';
// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/goingplacecreate/widget/titlesubtitle_widget.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// base
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class GoingPlaceCreateView extends StatefulWidget {
  const GoingPlaceCreateView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<GoingPlaceCreateView> createState() => _GoingPlaceCreateViewState();
}

class _GoingPlaceCreateViewState extends MainTodoBase<GoingPlaceCreateView> {
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
          "Gidilecek Yer Oluştur",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
      ),
      body: Form(
        key: serviceModel.formGoingPlaceAddKey,
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
              // going place start/end date
              buildMeetingDateWidget,
              // city start/finish location select widget
              buildCityStartSelectWidget,
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

  // going place date
  Widget get buildMeetingDateWidget => Row(
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
                      text: StringTodoConstants.dateGoingStartDate,
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
                      text: StringTodoConstants.dateGoingEndDate,
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
  // city start select
  Widget get buildCityStartSelectWidget => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: <Widget>[
            // start city select
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: maxWidth,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: LabelMediumGreyBoldText(
                        textAlign: TextAlign.left,
                        text: StringTodoConstants.cityStartLocationText,
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: serviceModel.cityStartSelect,
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.black54,
                        size: 24,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          serviceModel.cityStartSelect = value!;
                        });
                      },
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.labelMedium?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      items: serviceModel.cityList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            // finish city select
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: maxWidth,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: LabelMediumGreyBoldText(
                        textAlign: TextAlign.left,
                        text: StringTodoConstants.cityStartLocationText,
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: serviceModel.cityFinishSelect,
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.black54,
                        size: 24,
                      ),
                      elevation: 16,
                      onChanged: (String? value) {
                        setState(() {
                          serviceModel.cityFinishSelect = value!;
                        });
                      },
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.labelMedium?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      items: serviceModel.cityList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  // button
  Widget get // button
      buildButtonWidget => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                if (serviceModel.formGoingPlaceAddKey.currentState!
                    .validate()) {
                  goingPlaceAdd(widget.data);
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
