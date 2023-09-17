import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/feature/bottommenu/view/todocategory/view/todocreate/todocreate.dart';
import 'package:mytodo/product/constants/color_constant.dart';

class TodoCategoryView extends StatefulWidget {
  const TodoCategoryView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<TodoCategoryView> createState() => _TodoCategoryViewState();
}

class _TodoCategoryViewState extends State<TodoCategoryView> {
  @override
  Widget build(BuildContext context) {
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
          widget.data['TODO'].toString(),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoCreateView(
                      data: widget.data,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: ColorBackgroundConstant.purplePrimary,
                size: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
