import 'package:chat_app_mobile/controller/chat_controller.dart';
import 'package:chat_app_mobile/core/services/socket_services.dart';
import 'package:get/get.dart';

class AppBinding {
  static Bindings appBindings = BindingsBuilder(() {
    Get.lazyPut(() => SocketServices(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
  });
}
