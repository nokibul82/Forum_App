import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/post_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var token = box.read("token");
    return Scaffold(
      appBar: AppBar(
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
                  controller: _postController),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15)),
                  onPressed: () {},
                  child: const Text("Post")),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Text("Posts", style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 20,
              ),
              PostCard(),
              PostCard(),
              PostCard(),
              PostCard(),
              PostCard(),
              PostCard(),
            ],
          ),
        ),
      ),
    );
  }
}
