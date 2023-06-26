import 'package:flutter/material.dart';
import '../../models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.user!.name!,
              style: Theme.of(context).textTheme.bodyMedium),
          Text(post.user!.email!, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(
            height: 10,
          ),
          Text(
              post.content!,
              style: Theme.of(context).textTheme.bodySmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_up,size: 30,)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.comment,size: 30,)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: 30,)),
            ],
          )
        ],
      ),
    );
  }
}
