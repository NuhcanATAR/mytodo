import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// database
import 'package:mytodo/product/utility/firebase/database/home_db/homedb.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class NoteDetailsView extends StatelessWidget {
  const NoteDetailsView({
    super.key,
    required this.data,
    required this.notDelete,
    required this.maxWidth,
    required this.serviceModel,
    required this.dynamicHeight,
    required this.notUpd,
  });
  final Map<String, dynamic> data;
  final dynamic notDelete;
  final dynamic maxWidth;
  final dynamic serviceModel;
  final dynamic dynamicHeight;
  final dynamic notUpd;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleUpd = TextEditingController(
      text: data['TITLE'],
    );

    TextEditingController explanationUpd = TextEditingController(
      text: data['EXPLANATION'],
    );
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.white,
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
          data['TITLE'].toString(),
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    child: Padding(
                      padding: context.padding.normal,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            // note delete
                            Padding(
                              padding: context.padding.normal,
                              child: GestureDetector(
                                onTap: () {
                                  notDelete(data);
                                },
                                child: const Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: LabelMediumGreyBoldText(
                                        text: "Notu Kaldır!",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Icon(
                                      Icons.delete_outline,
                                      size: 24,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // note edit
                            Padding(
                              padding: context.padding.normal,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Form(
                                      key: serviceModel.formNotUpdKey,
                                      child: SizedBox(
                                        height: dynamicHeight(35.1),
                                        child: Padding(
                                          padding: context.padding.normal,
                                          child: ListView(
                                            children: <Widget>[
                                              // title
                                              const TitleMediumBlackGreyBoldText(
                                                textAlign: TextAlign.center,
                                                text: "Notu Güncelle",
                                              ),
                                              // title
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: TextFormField(
                                                  style: GoogleFonts.nunito(
                                                    textStyle: context.general
                                                        .textTheme.labelMedium
                                                        ?.copyWith(
                                                      color: ColorTextConstant
                                                          .blackGrey,
                                                    ),
                                                  ),
                                                  controller: titleUpd,
                                                  validator: serviceModel
                                                      .titleValidator,
                                                  decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: ColorBackgroundConstant
                                                                .purplePrimary)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            ColorBackgroundConstant
                                                                .purplePrimary,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    hintText: "* Başlık",
                                                    hintStyle:
                                                        GoogleFonts.nunito(
                                                      textStyle: context.general
                                                          .textTheme.labelMedium
                                                          ?.copyWith(
                                                        color: ColorTextConstant
                                                            .grey,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    textStyle: context.general
                                                        .textTheme.labelMedium
                                                        ?.copyWith(
                                                      color: ColorTextConstant
                                                          .blackGrey,
                                                    ),
                                                  ),
                                                  controller: explanationUpd,
                                                  validator: serviceModel
                                                      .explanationValidator,
                                                  minLines: 6,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: 6,
                                                  decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: ColorBackgroundConstant
                                                                .purplePrimary)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            ColorBackgroundConstant
                                                                .purplePrimary,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    hintText: "Açıklama *",
                                                    hintStyle:
                                                        GoogleFonts.nunito(
                                                      textStyle: context.general
                                                          .textTheme.labelMedium
                                                          ?.copyWith(
                                                        color: ColorTextConstant
                                                            .grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              // button
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    if (serviceModel
                                                        .formNotUpdKey
                                                        .currentState!
                                                        .validate()) {
                                                      return await HomeServiceDb
                                                          .NOTES.refAddCol
                                                          .doc(data['ID']
                                                              .toString())
                                                          .update({
                                                        "TITLE": titleUpd.text,
                                                        "EXPLANATION":
                                                            explanationUpd.text,
                                                      }).then((value) {
                                                        serviceModel.logger.i(
                                                            "Not Güncellendi!");
                                                        Navigator.pop(context);
                                                        final snackBar =
                                                            SnackBar(
                                                          content: const Text(
                                                              'Not Güncellendi!'),
                                                          action:
                                                              SnackBarAction(
                                                            label: 'Tamam',
                                                            onPressed: () {},
                                                          ),
                                                        );

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);

                                                        serviceModel
                                                            .titleUpdController(
                                                                data)
                                                            .clear();
                                                        serviceModel
                                                            .explanationUpdController(
                                                                data)
                                                            .clear();
                                                      }).catchError((err) {
                                                        serviceModel.logger
                                                            .i("Hata!: $err");
                                                        Navigator.pop(context);
                                                        final snackBar =
                                                            SnackBar(
                                                          content: const Text(
                                                              'Not Güncelleme Hatası!!'),
                                                          action:
                                                              SnackBarAction(
                                                            label: 'Tamam',
                                                            onPressed: () {},
                                                          ),
                                                        );

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                        serviceModel
                                                            .titleUpdController(
                                                                data)
                                                            .clear();
                                                        serviceModel
                                                            .explanationUpdController(
                                                                data)
                                                            .clear();
                                                      });
                                                    }
                                                  },
                                                  child: SizedBox(
                                                    width: maxWidth,
                                                    height: dynamicHeight(0.08),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            ColorBackgroundConstant
                                                                .purpleDarker,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(12),
                                                        ),
                                                      ),
                                                      child:
                                                          const LabelMediumWhiteText(
                                                        text: "Kaydet",
                                                        textAlign:
                                                            TextAlign.center,
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
                                child: const Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: LabelMediumGreyBoldText(
                                        text: "Notu Düzenle",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Icon(
                                      Icons.edit_document,
                                      size: 24,
                                      color: Colors.lightBlue,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.edit,
                color: ColorBackgroundConstant.purplePrimary,
                size: 21,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: context.padding.normal,
        child: ListView(
          children: <Widget>[
            // title
            TitleMediumBlackBoldText(
              textAlign: TextAlign.left,
              text: data['TITLE'].toString(),
            ),
            // explanation
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: LabelMediumGreyText(
                textAlign: TextAlign.left,
                text: data['EXPLANATION'].toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
