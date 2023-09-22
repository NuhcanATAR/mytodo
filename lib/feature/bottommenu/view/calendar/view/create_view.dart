import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/utility/base/calendar_base/calendar_base.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class CreatePlanView extends StatefulWidget {
  const CreatePlanView({super.key});

  @override
  State<CreatePlanView> createState() => _CreatePlanViewState();
}

class _CreatePlanViewState extends MainCalendarBase<CreatePlanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "İptal",
              style: GoogleFonts.nunito(
                textStyle: context.general.textTheme.bodyMedium?.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Etkinlik Oluştur",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorTextConstant.blackGrey,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: GestureDetector(
              onTap: () {
                if (serviceModel.formActivityKey.currentState!.validate()) {
                  saveNote();
                }
              },
              child: Text(
                "Kaydet",
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: ColorTextConstant.mainColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: serviceModel.formActivityKey,
        child: Padding(
          padding: context.padding.normal,
          child: ListView(
            children: <Widget>[
              // title
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: TextFormField(
                  style: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: ColorTextConstant.blackGrey,
                    ),
                  ),
                  controller: serviceModel.noteController,
                  validator: serviceModel.titleValidator,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                    filled: true,
                    hintText: "Başlık *",
                    hintStyle: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.labelMedium?.copyWith(
                        color: ColorTextConstant.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // explanation
              TextFormField(
                minLines: 4,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: ColorTextConstant.blackGrey,
                  ),
                ),
                controller: serviceModel.explanation,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
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
              ), // activity status
              // activity status
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: LabelMediumBlackBoldText(
                        text: "Tüm Gün",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Switch(
                      value: serviceModel.isActivityStatus,
                      activeColor: ColorBackgroundConstant.purplePrimary,
                      onChanged: (value) {
                        setState(() {
                          serviceModel.isActivityStatus = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              // location
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: TextFormField(
                  style: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: ColorTextConstant.blackGrey,
                    ),
                  ),
                  controller: serviceModel.location,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.redAccent,
                      size: 21,
                    ),
                    filled: true,
                    hintText: "Konum",
                    hintStyle: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.labelMedium?.copyWith(
                        color: ColorTextConstant.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
