import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// base
import 'package:mytodo/product/utility/base/profile_base/profile_base.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class NameSurnameUpdView extends StatefulWidget {
  const NameSurnameUpdView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<NameSurnameUpdView> createState() => _NameSurnameUpdViewState();
}

class _NameSurnameUpdViewState extends MainProfileBase<NameSurnameUpdView> {
  late TextEditingController nameUpd = TextEditingController(
    text: widget.data['NAME'],
  );
  late TextEditingController surnameUpd = TextEditingController(
    text: widget.data['SURNAME'],
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
            routerService.backViewPopRouter(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.purplePrimary,
            size: 21,
          ),
        ),
        title: Text(
          "Ad Soyad Değiştir",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorTextConstant.mainColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: context.padding.normal,
        child: ListView(
          children: <Widget>[
            // name
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: TextFormField(
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: ColorTextConstant.blackGrey,
                  ),
                ),
                controller: nameUpd,
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
                  hintStyle: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: ColorTextConstant.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // surname
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: TextFormField(
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: ColorTextConstant.blackGrey,
                  ),
                ),
                controller: surnameUpd,
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
                  hintStyle: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: ColorTextConstant.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // button
            GestureDetector(
              onTap: () {
                nameSurnameUpd(widget.data, nameUpd, surnameUpd);
              },
              child: SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.075),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorBackgroundConstant.purplePrimary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: LabelMediumWhiteText(
                    text: "Güncelle",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
