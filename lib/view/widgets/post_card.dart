import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  // PostCard({super.key, required this.title, required this.username, required this.description});
  //
  // final String title;
  // final String username;
  // final String description;

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
          Text("Mostai Shanto",
              style: Theme.of(context).textTheme.bodyMedium),
          Text("mst23", style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(
            height: 10,
          ),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
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
