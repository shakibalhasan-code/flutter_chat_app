import 'package:chat_app_mobile/controller/chat_controller.dart';
import 'package:chat_app_mobile/core/helper/widget_helper.dart';
import 'package:chat_app_mobile/core/services/socket_services.dart';
import 'package:chat_app_mobile/core/utils/app_constant.dart';
import 'package:chat_app_mobile/core/utils/app_styles.dart';
import 'package:chat_app_mobile/views/screens/chat/items/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController chatController = Get.find<ChatController>();
  final SocketServices socketServices = Get.find<SocketServices>();

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
              child: Obx(
                () =>
                    socketServices.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                          itemCount: chatController.messages.length,
                          itemBuilder: (context, index) {
                            final messageData = chatController.messages[index];
                            final String message = messageData['message'];
                            final bool isSender =
                                messageData['senderId'] == AppConstant.senderId;

                            return ChatItem(
                              message: message,
                              isSender: isSender,
                            );
                          },
                        ),
              ),
            ),
            _buildMessageInputField(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppStyles.secondaryColor,
        borderRadius: BorderRadius.circular(AppStyles.textFeildRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatController.messageController,
              style: AppStyles.smallText,
              decoration: InputDecoration(
                hintText: 'Message',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              String text = chatController.messageController.text.trim();
              if (text.isNotEmpty) {
                chatController.sendMessage(text);
                chatController.messageController.clear();
              }
            },
            icon: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
