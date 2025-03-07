import 'package:chat_app_mobile/core/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class ApiServices extends GetxService {
  var isLoading = false.obs;

  Future<http.Response> getData(
    String apiUrl,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  ) async {
    try {
      final request = await http.get(Uri.parse(apiUrl));
      if (request.statusCode == 200) {
        debugPrint('================${request.statusCode}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
