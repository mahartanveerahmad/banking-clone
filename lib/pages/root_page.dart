// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:banking_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageIndex = 4;
          });
        },
        backgroundColor: primary,
        child: const Icon(
          AntDesign.creditcard,
          size: 25,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getTabs() {
    List<IconData> iconsItems = [
      MaterialCommunityIcons.view_grid,
      MaterialCommunityIcons.comment,
      MaterialCommunityIcons.bell,
      MaterialCommunityIcons.account_circle,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconsItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        activeIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        });
  }
}
