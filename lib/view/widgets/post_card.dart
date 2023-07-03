import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/posts_controller.dart';
import '../../view/screens/post_details_screen.dart';
import '../../models/post_model.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});

  final PostModel post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  final PostController _postController = Get.put(PostController());
  Color likeColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                child: Text(widget.post.user!.name!.toString()[0],
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.post.user!.name!,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(widget.post.user!.email!,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(widget.post.content!, style: Theme.of(context).textTheme.bodySmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () async {
                    await _postController.toggleLike(widget.post.id!);
                    await _postController.getAllPost();
                  },
                  icon: Icon(
                    Icons.thumb_up,
                    color: widget.post.liked! ? Colors.blue : Colors.black,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    Get.to(PostDetailsScreen(post: widget.post));
                  },
                  icon: const Icon(
                    Icons.comment,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 30,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
