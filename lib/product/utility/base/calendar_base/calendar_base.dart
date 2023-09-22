import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';
import 'package:mytodo/product/models/calendar_model/calendar_model.dart';
import 'package:mytodo/product/router/calendar_router/calendar_router.dart';
import 'package:mytodo/product/utility/firebase/database/calendar_db/calendar_db.dart';
import 'package:mytodo/product/utility/firebase/service/firebase_service.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

abstract class MainCalendarBase<T extends StatefulWidget> extends State<T> {
  // model & database
  CalendarModelService serviceModel = CalendarModelService();
  FirebaseService firebaseService = FirebaseService();

  // router service
  CalendarRouterService routerService = CalendarRouterService();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;

  // Not eklemek için AlertDialog göster
  Future<void> showNoteDialog() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: maxHeight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Scaffold(
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
                            textStyle:
                                context.general.textTheme.bodyMedium?.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Etkinlik Oluştur",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyMedium?.copyWith(
                          color: ColorTextConstant.blackGrey,
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: GestureDetector(
                          onTap: () {
                            if (serviceModel.formActivityKey.currentState!
                                .validate()) {
                              saveNote();
                            }
                          },
                          child: Text(
                            "Kaydet",
                            style: GoogleFonts.nunito(
                              textStyle: context.general.textTheme.bodyMedium
                                  ?.copyWith(
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
                                textStyle: context.general.textTheme.labelMedium
                                    ?.copyWith(
                                  color: ColorTextConstant.blackGrey,
                                ),
                              ),
                              controller: serviceModel.noteController,
                              validator: serviceModel.titleValidator,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                filled: true,
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
                          TextFormField(
                            minLines: 4,
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            style: GoogleFonts.nunito(
                              textStyle: context.general.textTheme.labelMedium
                                  ?.copyWith(
                                color: ColorTextConstant.blackGrey,
                              ),
                            ),
                            controller: serviceModel.explanation,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              filled: true,
                              hintText: "Açıklama *",
                              hintStyle: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.labelMedium
                                    ?.copyWith(
                                  color: ColorTextConstant.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ), // activity status
                          // activity status
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10),
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
                                  activeColor:
                                      ColorBackgroundConstant.purplePrimary,
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
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 5),
                            child: TextFormField(
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.labelMedium
                                    ?.copyWith(
                                  color: ColorTextConstant.blackGrey,
                                ),
                              ),
                              controller: serviceModel.location,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Notu Firebase Firestore'a kaydet
  void saveNote() {
    final noteText = serviceModel.noteController.text;
    final explanationText = serviceModel.explanation.text;
    final location = serviceModel.location.text;
    final checkStatus = serviceModel.isActivityStatus;
    if (noteText.isNotEmpty) {
      firebaseService.cloudFire
          .collection("DATE")
          .doc(firebaseService.userID)
          .collection("DATEUSER")
          .doc(serviceModel.selectedDate.toString())
          .set({
        'NOTE': noteText,
        'EXPLANATION': explanationText,
        'LOCATION': location,
        'CHECKSTATUS': checkStatus,
      });
      setState(() {
        serviceModel.selectedNote = noteText;
        serviceModel.selectedExplanation = explanationText;
        serviceModel.selectedLocation = location;
        serviceModel.selectedCheckStatus = checkStatus;
      });
      serviceModel.noteController.clear();
      serviceModel.explanation.clear();
      serviceModel.location.clear();
    }
  }

  // Seçilen tarihe ait notu yükle
  void loadNoteForDate(DateTime date) async {
    final noteSnapshot = await firebaseService.cloudFire
        .collection("DATE")
        .doc(firebaseService.userID)
        .collection("DATEUSER")
        .doc(serviceModel.selectedDate.toString())
        .get();
    if (noteSnapshot.exists) {
      final data = noteSnapshot.data() as Map<String, dynamic>;
      final note = data['NOTE'] as String;
      final explanation = data['EXPLANATION'] as String;
      final location = data['LOCATION'] as String;
      final checkStatus = data['CHECKSTATUS'] as bool;
      setState(() {
        serviceModel.selectedNote = note;
        serviceModel.selectedExplanation = explanation;
        serviceModel.selectedLocation = location;
        serviceModel.selectedCheckStatus = checkStatus;
      });
    } else {
      setState(() {
        serviceModel.selectedNote = '';
        serviceModel.selectedExplanation = '';
        serviceModel.selectedLocation = '';
        serviceModel.selectedCheckStatus;
      });
    }
  }
}
