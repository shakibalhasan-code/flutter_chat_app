import 'package:chat_app_mobile/core/services/api_services.dart';
import 'package:chat_app_mobile/core/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final messageController = TextEditingController();
  final socketServices = Get.find<ChatController>();

  @override
  void onInit() {
    super.onInit();
  }

  //demo userid
  var messages = [].obs;

  void sendMessage(String message) async {
    if (messageController.text.isEmpty) {
      return;
    }
    socketServices.sendMessage(message);
  }
}
