import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.maxWidth,
    required this.serviceModel,
  });
  final dynamic maxWidth;
  final dynamic serviceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: serviceModel.selectedNote.isEmpty
          ? const SizedBox()
          : Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: maxWidth,
                        child: const LabelMediumGreyText(
                          text: "Plan",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // location
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            const LabelMediumRedColorText(
                              textAlign: TextAlign.left,
                              text: "Lokasyon:",
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                ),
                                child: LabelMediumGreyText(
                                  text: serviceModel.selectedLocation,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
// title
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            LabelMediumRedColorText(
                              textAlign: TextAlign.left,
                              text: serviceModel.selectedCheckStatus == true
                                  ? "Tüm Gün:"
                                  : "Belirsiz:",
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                ),
                                child: LabelMediumBlackBoldText(
                                  text: serviceModel.selectedNote,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // explanation
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            const LabelMediumRedColorText(
                              textAlign: TextAlign.left,
                              text: "Açıklama:",
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                ),
                                child: LabelMediumGreyText(
                                  text: serviceModel.selectedExplanation,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () async {
                      return await FirebaseFirestore.instance
                          .collection("DATE")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .collection("DATEUSER")
                          .doc(serviceModel.selectedDate.toString())
                          .delete()
                          .then((value) {
                        Logger().i("Silindi");
                        final snackBar = SnackBar(
                          content: const Text('Etkinlik Silindi!'),
                          action: SnackBarAction(
                            label: 'Tamam',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }).catchError((err) {
                        Logger().e("Hata");
                        final snackBar = SnackBar(
                          content: const Text('Hata oluştu!'),
                          action: SnackBarAction(
                            label: 'Tamam',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 21,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
