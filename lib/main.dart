import 'package:chat_app_mobile/core/utils/app_binding.dart';
import 'package:chat_app_mobile/core/utils/app_routes.dart';
import 'package:chat_app_mobile/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:
          (context, child) => GetMaterialApp(
            initialBinding: AppBinding.appBindings,
            getPages: AppRoutes.pages,
            initialRoute: AppRoutes.signIn,
            theme: AppStyles.themeData,
          ),
    );
  }
}
