import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/color_constant.dart';

class GoingPlaceCreateView extends StatefulWidget {
  const GoingPlaceCreateView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<GoingPlaceCreateView> createState() => _GoingPlaceCreateViewState();
}

class _GoingPlaceCreateViewState extends State<GoingPlaceCreateView> {
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
          "Gidilecek Yer Oluştur",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorBackgroundConstant.purplePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
