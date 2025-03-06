import 'package:chat_app_mobile/controller/chat_controller.dart';
import 'package:get/get.dart';

class AppBinding {
  static Bindings appBindings = BindingsBuilder(() {
    Get.lazyPut(() => ChatController());
  });
}
