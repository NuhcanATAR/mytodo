import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todoupdate/view/booksupdate/widget/titlesubtitle_widget.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';

import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class BooksUpdateView extends StatefulWidget {
  const BooksUpdateView(
      {super.key, required this.data, required this.mainData});
  final Map<String, dynamic> data;
  final Map<String, dynamic> mainData;

  @override
  State<BooksUpdateView> createState() => _BooksUpdateViewState();
}

class _BooksUpdateViewState extends MainTodoBase<BooksUpdateView> {
  late TextEditingController title = TextEditingController(
    text: widget.mainData['TITLE'].toString(),
  );
  late TextEditingController explanation = TextEditingController(
    text: widget.mainData['EXPLANATION'].toString(),
  );

  late int bookPageCount = widget.mainData['PAGECOUNT'];
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
          "Kitap Güncelle",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
      ),
      body: Form(
        key: serviceModel.bookAddKey,
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
              // book page count
              buildPageCountWidget,
              // book category list
              buildBookCategorysWidget,
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

  // book page count
  Widget get buildPageCountWidget => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: maxWidth,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: LabelMediumGreyBoldText(
                    textAlign: TextAlign.left,
                    text: StringTodoConstants.pageCountText),
              ),
            ),
            Row(
              children: <Widget>[
                // -
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bookPageCount--;
                    });
                  },
                  child: const Card(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.horizontal_rule,
                        size: 21,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                // count
                LabelMediumBlackBoldText(
                  textAlign: TextAlign.center,
                  text: bookPageCount.toString(),
                ),
                // +
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bookPageCount++;
                    });
                  },
                  child: const Card(
                    margin: EdgeInsets.only(left: 10),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.add,
                        size: 21,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  // book category list
  Widget get buildBookCategorysWidget => Column(
        children: <Widget>[
          SizedBox(
            width: maxWidth,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: LabelMediumGreyBoldText(
                textAlign: TextAlign.left,
                text: StringTodoConstants.bookCategoryText,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: widget.mainData['CATEGORY'],
              icon: const Icon(
                Icons.book,
                color: Colors.black54,
                size: 24,
              ),
              onChanged: (String? value) {
                setState(() {
                  widget.mainData['CATEGORY'] = value!;
                });
              },
              style: GoogleFonts.nunito(
                textStyle: context.general.textTheme.labelMedium?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              items: serviceModel.bookCategorys
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
  Widget get buildButtonWidget => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            if (serviceModel.bookAddKey.currentState!.validate()) {
              bookUpdate(widget.mainData, title, explanation, bookPageCount);
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
