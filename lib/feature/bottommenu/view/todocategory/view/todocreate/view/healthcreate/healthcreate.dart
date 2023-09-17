import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:mytodo/product/constants/color_constant.dart';

class HealthCreateView extends StatefulWidget {
  const HealthCreateView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<HealthCreateView> createState() => _HealthCreateViewState();
}

class _HealthCreateViewState extends State<HealthCreateView> {
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
          "Sağlık Planı Oluştur",
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
