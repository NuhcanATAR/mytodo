import 'package:flutter/material.dart';

// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';

// constant
import 'package:mytodo/product/constants/string_constant.dart';

// database
import 'package:mytodo/product/utility/firebase/database/profile_db/profiledb.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key, required this.routerService});
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // menu 1
        buildMenu1(context),
        // menu 2
        buildMenu2(context),
        // menu 3
        buildMenu3(context),
        // menu 4
        buildMenu4(context),
      ],
    );
  }

  // menu 1
  Widget buildMenu1(context) => FutureBuilder<DocumentSnapshot>(
        future: ProfileDb.USERS.userRefCol,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {}

          if (snapshot.hasData && !snapshot.data!.exists) {}

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return GestureDetector(
              onTap: () {
                routerService.userNameSurnameUpdRouterView(context, data);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: const Row(
                  children: <Widget>[
                    Expanded(
                      child: LabelMediumGreyBoldText(
                        text: StringProfileConstants.menu1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );

  // menu 2
  Widget buildMenu2(context) => GestureDetector(
        onTap: () {
          routerService.emailUpdRouterView(context);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: const Row(
            children: <Widget>[
              Expanded(
                child: LabelMediumGreyBoldText(
                  text: StringProfileConstants.menu2,
                  textAlign: TextAlign.left,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
      );

  // menu 3
  Widget buildMenu3(context) => GestureDetector(
        onTap: () {
          routerService.passwordUpdRouterView(context);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: const Row(
            children: <Widget>[
              Expanded(
                child: LabelMediumGreyBoldText(
                  text: StringProfileConstants.menu3,
                  textAlign: TextAlign.left,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
      );

  // menu 4
  Widget buildMenu4(context) => GestureDetector(
        onTap: () async {
          routerService.userExitAccount(context);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: const Row(
            children: <Widget>[
              Expanded(
                child: LabelMediumGreyBoldText(
                  text: StringProfileConstants.menu4,
                  textAlign: TextAlign.left,
                ),
              ),
              Icon(
                Icons.exit_to_app,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
      );
}
