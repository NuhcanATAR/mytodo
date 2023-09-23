import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// routers
import 'package:mytodo/product/router/profile_router/profile_router.dart';

class EmailUpdView extends StatelessWidget {
  const EmailUpdView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileRouterService routerService = ProfileRouterService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            routerService.backViewPopRouter(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.purplePrimary,
            size: 21,
          ),
        ),
        title: Text(
          "E-mail Güncelle",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorTextConstant.mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
