import 'package:flutter/material.dart';

// pub dev
import 'package:kartal/kartal.dart';

// widget
import 'package:mytodo/feature/bottommenu/view/profile/widget/menulist_widget.dart';
import 'package:mytodo/feature/bottommenu/view/profile/widget/title_widget.dart';
import 'package:mytodo/feature/bottommenu/view/profile/widget/top_widget.dart';

// base
import 'package:mytodo/product/utility/base/profile_base/profile_base.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends MainProfileBase<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.normal,
        child: ListView(
          children: <Widget>[
            // title
            buildTitleWidget,
            // top
            buildTopWidget,
            // menus
            buildMenuListWidget,
          ],
        ),
      ),
    );
  }

  // title
  Widget get buildTitleWidget => TitleWidget(maxWidth: maxWidth);
  // top
  Widget get buildTopWidget =>
      TopWidget(maxWidth: maxWidth, dynamicHeight: dynamicHeight);
  // menus
  Widget get buildMenuListWidget => MenuList(
        routerService: routerService,
      );
}
