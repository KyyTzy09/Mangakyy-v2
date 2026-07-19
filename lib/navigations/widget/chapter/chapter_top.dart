import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/chapter/chapter_bottom.dart';

class ChapterTop extends StatelessWidget {
  final bool isVisible;
  const ChapterTop({super.key, this.isVisible = true});
  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: isVisible ? Offset.zero : const Offset(0, -1.0),
      duration: const Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(color: Colors.black.withAlpha(200)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Judul Manga',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Chapter 1',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
