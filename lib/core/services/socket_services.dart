import 'package:chat_app_mobile/controller/chat_controller.dart';
import 'package:chat_app_mobile/core/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketServices extends GetxService {
  var message = ''.obs;
  var isLoading = false.obs;
  late IO.Socket socketIo;

  final chatController =
      Get.find<ChatController>(); // Ensure this is initialized in main.dart

  @override
  void onInit() {
    super.onInit();
    initSocketClient();
  }

  Future<void> initSocketClient() async {
    try {
      isLoading.value = true;

      socketIo = IO.io(
        AppConstant.baseUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setReconnectionAttempts(5) // Ensures reconnection on disconnect
            .setReconnectionAttempts(5) // Try reconnecting 5 times
            .build(),
      );

      socketIo.onConnect((_) {
        isLoading.value = false;
        debugPrint('✅ Connected to Socket.IO server');
      });

      socketIo.onDisconnect((_) {
        debugPrint('⚠ Disconnected from Socket.IO server');
      });

      socketIo.onError((e) {
        isLoading.value = false;
        debugPrint('❌ Socket.IO Error: $e');
      });

      socketIo.onReconnectAttempt((_) {
        debugPrint('♻️ Reconnecting to Socket.IO server...');
      });

      socketIo.onReconnectFailed((_) {
        debugPrint('🚨 Reconnection failed');
      });

      // Listening for incoming messages
      socketIo.on('receiver-${AppConstant.receiverId}', (data) {
        debugPrint('📩 New message received: $data');

        chatController.messages.add({
          "senderId": data['senderId'],
          "receiverId": data['receiverId'],
          "senderModel": data['senderModel'],
          "receiverModel": data['receiverModel'],
          "message": data['message'],
        });
      });
    } catch (e) {
      isLoading.value = false;
      debugPrint('❌ Socket initialization error: $e');
    }
  }

  void sendMessage(String message) {
    if (!socketIo.connected) {
      debugPrint('⚠ Socket.IO is not connected. Cannot send message.');
      return;
    }

    final messageData = {
      "senderId": AppConstant.senderId,
      "receiverId": AppConstant.receiverId,
      "senderModel": "User",
      "receiverModel": "Doctor",
      "message": message,
    };

    socketIo.emit('sendMessage', messageData);
    debugPrint('📤 Message sent: $messageData');

    // Add to local UI instantly
    chatController.messages.add(messageData);
  }

  @override
  void onClose() {
    socketIo.dispose(); // Ensure socket is closed when service is destroyed
    super.onClose();
  }
}
