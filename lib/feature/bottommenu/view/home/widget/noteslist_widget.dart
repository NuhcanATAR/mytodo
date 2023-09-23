import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/home/view/notesdetails_view.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/img_constant.dart';

// database
import 'package:mytodo/product/utility/firebase/database/home_db/homedb.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class NotesListWidget extends StatelessWidget {
  const NotesListWidget({
    super.key,
    required this.maxWidth,
    required this.dynamicHeight,
    required this.serviceModel,
    required this.notAdd,
    required this.notDelete,
    required this.notUpd,
  });
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic serviceModel;
  final dynamic notAdd;
  final dynamic notDelete;
  final dynamic notUpd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: StreamBuilder<QuerySnapshot>(
        stream: HomeServiceDb.NOTES.refNoteStreamListCol,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {}

          if (snapshot.connectionState == ConnectionState.waiting) {}

          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.docs.isNotEmpty) {
            return Column(
              children: <Widget>[
                // title
                Padding(
                  padding: context.padding.normal,
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: LabelMediumGreyBoldText(
                          text: "Yapışkan Notlar",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Form(
                              key: serviceModel.formNotAddKey,
                              child: SizedBox(
                                height: dynamicHeight(35.1),
                                child: Padding(
                                  padding: context.padding.normal,
                                  child: ListView(
                                    children: <Widget>[
                                      // title
                                      const TitleMediumBlackGreyBoldText(
                                        textAlign: TextAlign.center,
                                        text: "Not ekle",
                                      ),
                                      // title
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 5),
                                        child: TextFormField(
                                          style: GoogleFonts.nunito(
                                            textStyle: context
                                                .general.textTheme.labelMedium
                                                ?.copyWith(
                                              color:
                                                  ColorTextConstant.blackGrey,
                                            ),
                                          ),
                                          controller:
                                              serviceModel.titleController,
                                          validator:
                                              serviceModel.titleValidator,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        ColorBackgroundConstant
                                                            .purplePrimary)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ColorBackgroundConstant
                                                    .purplePrimary,
                                                width: 1,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: "Başlık *",
                                            hintStyle: GoogleFonts.nunito(
                                              textStyle: context
                                                  .general.textTheme.labelMedium
                                                  ?.copyWith(
                                                color: ColorTextConstant.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // explanation
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 5),
                                        child: TextFormField(
                                          style: GoogleFonts.nunito(
                                            textStyle: context
                                                .general.textTheme.labelMedium
                                                ?.copyWith(
                                              color:
                                                  ColorTextConstant.blackGrey,
                                            ),
                                          ),
                                          controller: serviceModel
                                              .explanationController,
                                          validator:
                                              serviceModel.explanationValidator,
                                          minLines: 6,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 6,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        ColorBackgroundConstant
                                                            .purplePrimary)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ColorBackgroundConstant
                                                    .purplePrimary,
                                                width: 1,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: "Açıklama *",
                                            hintStyle: GoogleFonts.nunito(
                                              textStyle: context
                                                  .general.textTheme.labelMedium
                                                  ?.copyWith(
                                                color: ColorTextConstant.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // button
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (serviceModel
                                                .formNotAddKey.currentState!
                                                .validate()) {
                                              notAdd();
                                            }
                                          },
                                          child: SizedBox(
                                            width: maxWidth,
                                            height: dynamicHeight(0.08),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: ColorBackgroundConstant
                                                    .purpleDarker,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(12),
                                                ),
                                              ),
                                              child: const LabelMediumWhiteText(
                                                text: "Kaydet",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 250,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: ColorBackgroundConstant.purplePrimary,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                // list
                SizedBox(
                  width: maxWidth,
                  height: dynamicHeight(0.35),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoteDetailsView(
                                data: data,
                                notDelete: notDelete,
                                maxWidth: maxWidth,
                                serviceModel: serviceModel,
                                dynamicHeight: dynamicHeight,
                                notUpd: notUpd,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: maxWidth * 0.5,
                          child: Container(
                            margin: const EdgeInsets.only(left: 15, right: 4),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 70, left: 5, right: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    ImgIMGConstant.appHomeNoteImg.tojpg1),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  // title
                                  Container(
                                    width: maxWidth,
                                    padding: const EdgeInsets.all(5),
                                    child: TitleMediumBlackBoldText(
                                      textAlign: TextAlign.left,
                                      text: data['TITLE'].toString(),
                                    ),
                                  ),
                                  // explanation
                                  Container(
                                    width: maxWidth,
                                    padding: const EdgeInsets.all(3),
                                    child: LabelMediumGreyText(
                                      textAlign: TextAlign.left,
                                      text: data['EXPLANATION'].toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: <Widget>[
                // title
                Padding(
                  padding: context.padding.normal,
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: TitleMediumBlackGreyBoldText(
                          text: "Yapışkan Notlar",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Form(
                              key: serviceModel.formNotAddKey,
                              child: SizedBox(
                                height: dynamicHeight(35.1),
                                child: Padding(
                                  padding: context.padding.normal,
                                  child: ListView(
                                    children: <Widget>[
                                      // title
                                      const TitleMediumBlackGreyBoldText(
                                        textAlign: TextAlign.center,
                                        text: "Not ekle",
                                      ),
                                      // title
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 5),
                                        child: TextFormField(
                                          style: GoogleFonts.nunito(
                                            textStyle: context
                                                .general.textTheme.labelMedium
                                                ?.copyWith(
                                              color:
                                                  ColorTextConstant.blackGrey,
                                            ),
                                          ),
                                          controller:
                                              serviceModel.titleController,
                                          validator:
                                              serviceModel.titleValidator,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        ColorBackgroundConstant
                                                            .purplePrimary)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ColorBackgroundConstant
                                                    .purplePrimary,
                                                width: 1,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: "Başlık *",
                                            hintStyle: GoogleFonts.nunito(
                                              textStyle: context
                                                  .general.textTheme.labelMedium
                                                  ?.copyWith(
                                                color: ColorTextConstant.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // explanation
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 5),
                                        child: TextFormField(
                                          style: GoogleFonts.nunito(
                                            textStyle: context
                                                .general.textTheme.labelMedium
                                                ?.copyWith(
                                              color:
                                                  ColorTextConstant.blackGrey,
                                            ),
                                          ),
                                          controller: serviceModel
                                              .explanationController,
                                          validator:
                                              serviceModel.explanationValidator,
                                          minLines: 6,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 6,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        ColorBackgroundConstant
                                                            .purplePrimary)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ColorBackgroundConstant
                                                    .purplePrimary,
                                                width: 1,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: "Açıklama *",
                                            hintStyle: GoogleFonts.nunito(
                                              textStyle: context
                                                  .general.textTheme.labelMedium
                                                  ?.copyWith(
                                                color: ColorTextConstant.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // button
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (serviceModel
                                                .formNotAddKey.currentState!
                                                .validate()) {
                                              notAdd();
                                            }
                                          },
                                          child: SizedBox(
                                            width: maxWidth,
                                            height: dynamicHeight(0.08),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: ColorBackgroundConstant
                                                    .purpleDarker,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(12),
                                                ),
                                              ),
                                              child: const LabelMediumWhiteText(
                                                text: "Kaydet",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 250,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: ColorBackgroundConstant.purplePrimary,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                // card
                SizedBox(
                  width: maxWidth,
                  height: dynamicHeight(0.2),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.help_outline,
                          color: ColorBackgroundConstant.purplePrimary,
                          size: 24,
                        ),
                        const TitleMediumBlackBoldText(
                            textAlign: TextAlign.center,
                            text: "Henüz Yapışkan Not Oluşturmadınız")
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
