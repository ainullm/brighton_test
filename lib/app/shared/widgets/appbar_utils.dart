import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../styles/app_colors.dart';
import '../utils/images_utils.dart';


class MyAppBar {
  MyAppBar();

  static AppBar none({
    Widget? leading,
    Widget? title,
    Color? backgroundColor,
    double? elevation,
    TextStyle? styleText,
    bool? autoLeading,
    List<Widget>? action,
    bool? centerTitle,
    Function()? onTapLeading,
    double? leadingWidth,
  }) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      title: title ?? const Text('Kembali'),
      titleTextStyle: styleText,
      titleSpacing: 10,
      automaticallyImplyLeading: autoLeading ?? false,
      leading: leading ??
          GestureDetector(
            onTap: onTapLeading ??
                () {
                  Get.back();
                },
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
              alignment: Alignment.centerRight,
              child: AppImage.svg(
                'ic-back',
                fit: BoxFit.contain,
                width: 25,
                color: black2,
              ),
            ),
          ),
      centerTitle: centerTitle ?? false,
      leadingWidth: leadingWidth ?? 50,
      actions: action,
    );
  }

  static AppBar fill({
    Widget? leading,
    Widget? title,
    Color? backgroundColor,
    double? elevation,
    TextStyle? styleText,
    bool? autoLeading,
    List<Widget>? action,
    bool? centerTitle,
    Function()? onTapLeading,
    double? leadingWidth,
  }) {
    return AppBar(
      backgroundColor: backgroundColor ?? primaryColor,
      elevation: elevation ?? 0,
      title: title ?? const Text('Kembali'),
      titleTextStyle: styleText,
      titleSpacing: 10,
      automaticallyImplyLeading: autoLeading ?? false,
      leading: leading ??
          GestureDetector(
            onTap: onTapLeading ??
                () {
                  Get.back();
                },
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 18, 10, 18),
              alignment: Alignment.centerRight,
              child: AppImage.svg(
                'ic-back',
                fit: BoxFit.contain,
                color: white,
                width: 25,
              ),
            ),
          ),
      centerTitle: centerTitle ?? false,
      leadingWidth: leadingWidth ?? 50,
      actions: action,
    );
  }

  static AppBar fillNav({
    Widget? title,
    Color? backgroundColor,
    double? elevation,
    TextStyle? styleText,
    bool? autoLeading,
    List<Widget>? action,
    bool? centerTitle,
  }) {
    return AppBar(
      backgroundColor: backgroundColor ?? primaryColor,
      elevation: elevation ?? 0,
      title: title ?? const Text('Name'),
      titleTextStyle: styleText,
      titleSpacing: 20,
      automaticallyImplyLeading: autoLeading ?? false,
      centerTitle: centerTitle ?? false,
      actions: action,
      toolbarHeight: 80,
    );
  }
}
