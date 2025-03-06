import 'package:chat_app_mobile/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WidgetHelper {
  static AppBar showAppBar({required String title, required bool isBack}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: AppStyles.largeText.copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
