import 'package:chat_app_mobile/core/helper/widget_helper.dart';
import 'package:chat_app_mobile/core/utils/app_routes.dart';
import 'package:chat_app_mobile/core/utils/app_styles.dart';
import 'package:chat_app_mobile/views/glob_widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserSigninScreen extends StatelessWidget {
  const UserSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: AppStyles.largeText.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Please enter your partner userId below and get connected',
                textAlign: TextAlign.center,
                style: AppStyles.mediumText,
              ),
              SizedBox(height: 15.h),
              TextField(
                style: AppStyles.smallText,
                decoration: InputDecoration(hintText: 'enter your partner ID'),
              ),
              SizedBox(height: 5.h),
              MyButton(
                buttonText: 'Let\'s get in',
                onTap: () => Get.toNamed(AppRoutes.chatScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
