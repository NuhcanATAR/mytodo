import 'package:flutter/material.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// widget
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';

class NoteCreateButton extends StatelessWidget {
  const NoteCreateButton(
      {super.key,
      required this.showNoteDialog,
      required this.maxWidth,
      required this.dynamicHeight});
  final dynamic showNoteDialog;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const CreatePlanView(),
        //   ),
        // );
        showNoteDialog();
      },
      child: Card(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.07),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorBackgroundConstant.purplePrimary,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 21,
                ),
                LabelMediumWhiteText(
                  text: "Not Oluştur!",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
