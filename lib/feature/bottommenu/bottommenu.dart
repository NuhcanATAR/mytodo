import 'package:flutter/material.dart';

// model & database
import 'package:mytodo/product/models/bottommenu_model/bottommenu_model.dart';
// theme
import 'package:mytodo/product/constants/color_constant.dart';

class BottomMenuView extends StatefulWidget {
  const BottomMenuView({super.key});

  @override
  State<BottomMenuView> createState() => _BottomMenuViewState();
}

class _BottomMenuViewState extends State<BottomMenuView> {
  BottomMenuServiceModel serviceModel = BottomMenuServiceModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: serviceModel.viewList[serviceModel.currentMenuIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            serviceModel.currentMenuIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        selectedIndex: serviceModel.currentMenuIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home_outlined,
              color: ColorBackgroundConstant.purplePrimary,
              size: 24,
            ),
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.grey,
              size: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.warning_amber_outlined,
              color: ColorBackgroundConstant.purplePrimary,
              size: 24,
            ),
            icon: const Icon(
              Icons.warning_amber_outlined,
              color: Colors.grey,
              size: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.favorite_outline,
              color: ColorBackgroundConstant.purplePrimary,
              size: 24,
            ),
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.date_range_outlined,
              color: ColorBackgroundConstant.purplePrimary,
              size: 24,
            ),
            icon: const Icon(
              Icons.date_range_outlined,
              color: Colors.grey,
              size: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.account_circle_outlined,
              color: ColorBackgroundConstant.purplePrimary,
              size: 24,
            ),
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.grey,
              size: 24,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
