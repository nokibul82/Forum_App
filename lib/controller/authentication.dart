import 'dart:convert';
import 'package:forumapp/view/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:get_storage/get_storage.dart';
class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = "".obs;

  final box = GetStorage();

  Future register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'name': name,
        'username': username,
        'email': email,
        'password': password
      };

      var response = await http.post(Uri.parse('${url}register'),
          headers: {"Accept": "application/json"}, body: data);

      if (response.statusCode == 201) {
        isLoading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write("token", token.value);
        Get.offAll(()=> HomeScreen());
      } else {
        isLoading.value = false;
        Get.snackbar("error", json.decode(response.body)['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
        print("============================================");
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print("==============================================\n" + e.toString());
    }
  }


  Future login({
    required String username,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'username': username,
        'password': password
      };

      var response = await http.post(Uri.parse('${url}login'),
          headers: {"Accept": "application/json"}, body: data);

      if (response.statusCode == 200) {
        isLoading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write("token", token.value);
        Get.offAll(()=> HomeScreen());
      } else {
        isLoading.value = false;
        Get.snackbar("error", json.decode(response.body)['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
        print("============================================");
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print("==============================================\n" + e.toString());
    }
  }
}
