import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/input_field_widget.dart';
import '../widgets/post_card.dart';
import '../../controller/posts_controller.dart';
import '../../models/post_model.dart';

class PostDetailsScreen extends StatefulWidget {
  PostDetailsScreen({
    super.key,
    required this.post,
  });
  final PostModel post;
  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final _textEditingController = TextEditingController();
  final PostController _postController = Get.put(PostController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _postController.getComments(widget.post.id.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Comments",
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            PostCard(post: widget.post),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: Get.height * 0.5,
              child: Obx(() {
                return _postController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: _postController.comments.value.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              child: Text(
                                  _postController
                                      .comments.value[index].user!.name!
                                      .toString()[0],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary)),
                            ),
                            title: Text(
                              _postController.comments.value[index].user!.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                _postController.comments.value[index].body!,
                                style: Theme.of(context).textTheme.bodySmall),
                          );
                        });
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    onPrimary: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                onPressed: () async {
                  await _postController.createComment(widget.post.id.toString(),
                      _textEditingController.text.trim());
                  _textEditingController.clear();
                  await _postController.getComments(widget.post.id.toString());
                },
                child: const Text("Comment"),
              ),
            ),
            InputFieldWidget(
                hintText: "Write a comment...",
                obscureText: false,
                textEditingController: _textEditingController),

          ],
        ),
      ),
    );
  }
}
