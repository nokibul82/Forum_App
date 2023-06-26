import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/posts_controller.dart';
import '../widgets/post_card.dart';
import '../widgets/post_field.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});


  final _postController = Get.put(PostController());
  final _postTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var token = box.read("token");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feeds",
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostField(
                  hintText: "What do you want to ask ?",
                  controller: _postTextController),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15)),
                  onPressed: () async {
                    await _postController.createPost(
                        content: _postTextController.text.trim());
                    _postTextController.clear();
                    _postController.getAllPost();
                  },
                  child: Obx(() {
                    return _postController.isLoading.value
                        ? CircularProgressIndicator(strokeWidth: 2,color: Theme.of(context).colorScheme.secondary,)
                        : const Text("Post");
                  })),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Text("Posts", style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return _postController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(strokeWidth: 2,color: Theme.of(context).colorScheme.onPrimary),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _postController.posts.value.length,
                        itemBuilder: (context, index) {
                          return PostCard(
                            post: _postController.posts.value[index],
                          );
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
