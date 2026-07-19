import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/chapter/chapter_bottom.dart';

class ChapterTop extends StatelessWidget {
  final bool isVisible;
  const ChapterTop({super.key, this.isVisible = true});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: isVisible ? 70 : 0,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
        child: Row(
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
                  '5 days ago   ',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
