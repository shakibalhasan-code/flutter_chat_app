import 'package:chat_app_mobile/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  final bool isSender;
  final String message;
  const ChatItem({super.key, required this.isSender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Align(
        alignment: isSender ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            color:
                isSender ? AppStyles.secondaryColor : AppStyles.themeGreyColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Text(message, style: AppStyles.smallText),
          ),
        ),
      ),
    );
  }
}
