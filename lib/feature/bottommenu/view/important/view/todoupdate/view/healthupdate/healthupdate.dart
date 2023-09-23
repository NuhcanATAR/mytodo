import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/healthupdate/widget/titlesubtitle_widget.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

// base
import '../../../../../../../../product/utility/base/important_base/important_base.dart';

class HealthUpdateView extends StatefulWidget {
  const HealthUpdateView(
      {super.key, required this.data, required this.maindata});
  final Map<String, dynamic> data;
  final Map<String, dynamic> maindata;

  @override
  State<HealthUpdateView> createState() => _HealthUpdateViewState();
}

class _HealthUpdateViewState extends MainImportantBase<HealthUpdateView> {
  late TextEditingController title = TextEditingController(
    text: widget.maindata['TITLE'],
  );
  late TextEditingController explanation = TextEditingController(
    text: widget.maindata['EXPLANATION'],
  );

  late DateTime goingDate = DateTime(
    widget.maindata['GOINGYEAR'],
    widget.maindata['GOINGMONTH'],
    widget.maindata['GOINGDAY'],
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
          "Sağlık Planı Güncelle",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
      ),
      body: Form(
        key: serviceModel.healtAddKey,
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
              // healt type
              healtSelectTypeWidget,
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

  // going place date
  Widget get buildMeetingDateWidget => Column(
        children: <Widget>[
          SizedBox(
            width: maxWidth,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: LabelMediumGreyBoldText(
                textAlign: TextAlign.left,
                text: StringTodoConstants.healthCreateDate,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: goingDate,
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
                  goingDate = dateTime;
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
                  text: "${goingDate.day}.${goingDate.month}.${goingDate.year}",
                ),
              ],
            ),
          )
        ],
      );
  // healt type
  Widget get healtSelectTypeWidget => Column(
        children: <Widget>[
          SizedBox(
            width: maxWidth,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 5, top: 20),
              child: LabelMediumGreyBoldText(
                textAlign: TextAlign.left,
                text: StringTodoConstants.healtType,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: widget.maindata['CATEGORY'],
              icon: const Icon(
                Icons.local_hospital,
                color: Colors.black54,
                size: 24,
              ),
              onChanged: (String? value) {
                setState(() {
                  widget.maindata['CATEGORY'] = value!;
                });
              },
              style: GoogleFonts.nunito(
                textStyle: context.general.textTheme.labelMedium?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              items: serviceModel.healthCategory
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
                if (serviceModel.healtAddKey.currentState!.validate()) {
                  healtPLanUpdate(
                      widget.maindata, title, explanation, goingDate);
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
