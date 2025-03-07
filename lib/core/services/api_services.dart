import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServices extends GetxService {
  final http.Client client;

  // Injecting http.Client for better testability
  ApiServices({required this.client});

  Future<http.Response> getData(
    String apiUrl, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await client.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error in getData: $e");
      rethrow;
    }
  }

  Future<http.Response> postData(
    String apiUrl, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to post data: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error in postData: $e");
      rethrow;
    }
  }
}
