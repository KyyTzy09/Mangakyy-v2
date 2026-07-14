import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';

class ComicWidget extends StatelessWidget {
  final ComicModel comic;
  const ComicWidget({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          comic.title ?? "No Title",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
