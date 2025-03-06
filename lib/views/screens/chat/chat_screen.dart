import 'package:chat_app_mobile/controller/chat_controller.dart';
import 'package:chat_app_mobile/core/helper/widget_helper.dart';
import 'package:chat_app_mobile/core/utils/app_styles.dart';
import 'package:chat_app_mobile/views/screens/chat/items/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.showAppBar(title: 'Danny Hopkins', isBack: false),
      backgroundColor: AppStyles.primaryBgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index]['message'];
                  final bool isSender =
                      chatController.messages[index]['isSender'];

                  return ChatItem(message: message, isSender: isSender);
                },
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppStyles.secondaryColor,
                borderRadius: BorderRadius.circular(AppStyles.textFeildRadius),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.send, color: AppStyles.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
