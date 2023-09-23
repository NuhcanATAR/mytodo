import 'package:flutter/material.dart';

// database
import 'package:mytodo/product/utility/firebase/database/profile_db/profiledb.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.maxWidth,
    required this.dynamicHeight,
  });
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: ProfileDb.USERS.userRefCol,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const SizedBox();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                // profile image
                SizedBox(
                  width: dynamicHeight(0.1),
                  height: dynamicHeight(0.1),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(124),
                      ),
                    ),
                    child: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 55,
                    ),
                  ),
                ),
                // user information
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // name surname
                        SizedBox(
                          width: maxWidth,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: LabelMediumBlackBoldText(
                                text: "${data['NAME']} ${data['SURNAME']}",
                                textAlign: TextAlign.left,
                              )),
                        ),
                        // email
                        SizedBox(
                          width: maxWidth,
                          child: LabelMediumGreyText(
                            text: "${data['MAIL']}",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
