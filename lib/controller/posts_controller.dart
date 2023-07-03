import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/comment_model.dart';
import '../models/post_model.dart';

class PostController extends GetxController {
  final posts = Rx<List<PostModel>>([]);
  final comments = Rx<List<CommentModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    getAllPost();
    super.onInit();
  }

  Future getAllPost() async {
    try {
      posts.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse("${url}feeds"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${box.read("token")}"
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final data = json.decode(response.body)['feeds'];
        for (var item in data) {
          posts.value.add(PostModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        Get.snackbar("Error", json.decode(response.body)["message"],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    } catch (e) {
      isLoading.value = false;
      print("=====================================");
      print(e.toString());
    }
  }

  Future createPost({required String content}) async {
    try {
      isLoading.value = true;
      var data = {
        "content": content,
      };
      var response = await http.post(Uri.parse("${url}feed/store"),
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${box.read("token")}"
          },
          body: data);

      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.snackbar("Success", json.decode(response.body)["message"],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white);
      } else {
        isLoading.value = false;
        Get.snackbar("Error", json.decode(response.body)["message"],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    } catch (e) {
      isLoading.value = false;
      print("=====================================");
      print(e.toString());
    }
  }

  Future getComments(String id) async{
    try{
      comments.value.clear();
      isLoading.value = true;

      var response = await http.get(Uri.parse("${url}feed/comments/${id}"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${box.read("token")}"
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final data = json.decode(response.body)['comments'];
        for (var item in data) {
          comments.value.add(CommentModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        Get.snackbar("Error", json.decode(response.body)["message"],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    }catch(e){
      isLoading.value = false;
      print("=====================================");
      print(e.toString());
    }
  }

  Future createComment(String id, String body) async{
    try{
      isLoading.value = true;
      var data = {
        "body": body,
      };
      var response = await http.post(Uri.parse("${url}feed/comment/$id"),
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${box.read("token")}"
          },
          body: data);

      if (response.statusCode == 201) {
        isLoading.value = false;
        Get.snackbar("✔", json.decode(response.body)["message"],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white);
      } else {
        isLoading.value = false;
        Get.snackbar("Error", json.decode(response.body)["message"],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    }catch(e){
      isLoading.value = false;
      print("=====================================");
      print(e.toString());
    }
  }
}
