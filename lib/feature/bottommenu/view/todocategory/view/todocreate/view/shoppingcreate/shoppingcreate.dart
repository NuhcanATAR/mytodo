import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/view/shoppingcreate/widget/titlesubtitle_widget.dart';
import 'package:mytodo/product/constants/color_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/utility/base/todo_base/todo_base.dart';

import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class ShoppingListCreateView extends StatefulWidget {
  const ShoppingListCreateView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<ShoppingListCreateView> createState() => _ShoppingListCreateViewState();
}

class _ShoppingListCreateViewState
    extends MainTodoBase<ShoppingListCreateView> {
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
          "Alışveriş Listesi Oluştur",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
      ),
      body: Form(
        key: serviceModel.shoppingAddKey,
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
              // shopping type
              buildShoppingTypeSelectWidget,
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
          controller: serviceModel.titleController,
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
          controller: serviceModel.explanationController,
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

  // shopping type
  Widget get buildShoppingTypeSelectWidget => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: maxWidth,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: LabelMediumGreyBoldText(
                  textAlign: TextAlign.left,
                  text: StringTodoConstants.shoppingTypeText,
                ),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: serviceModel.shoppingCategorySelect,
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.black54,
                  size: 24,
                ),
                onChanged: (String? value) {
                  setState(() {
                    serviceModel.shoppingCategorySelect = value!;
                  });
                },
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: serviceModel.shoppingCategory
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      );

  // button
  Widget get // button
      buildButtonWidget => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                if (serviceModel.shoppingAddKey.currentState!.validate()) {
                  shoppingListAdd();
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
                    text: StringTodoConstants.button,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
}
