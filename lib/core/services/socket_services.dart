import 'package:chat_app_mobile/core/utils/app_constant.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketServices extends GetxService {
  var message = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    initSocketClient();
    super.onInit();
  }

  Future<void> initSocketClient() async {
    try {
      isLoading.value = true;
      final socketIo = IO.io(
        AppConstant.baseUrl,
        IO.OptionBuilder()
            .setTransports(['websocket']) // Use WebSockets
            .enableAutoConnect()
            .build(),
      );
      socketIo.onConnect((_) {
        isLoading.value = false;

        print('===================>>>>>>>>>connected');
      });
      socketIo.onError((e) {
        isLoading.value = false;

        print('===================>>>>>>>>>error to connect $e');
      });
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }
}
