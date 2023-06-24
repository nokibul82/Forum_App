import 'package:flutter/material.dart';

class PostField extends StatelessWidget {
  const PostField({super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
        ),
      ),
    );
  }
}