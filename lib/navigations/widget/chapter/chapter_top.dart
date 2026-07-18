import 'package:flutter/material.dart';

class ChapterTop extends StatelessWidget {
  final bool isVisible;
  const ChapterTop({super.key, this.isVisible = true});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Colors.transparent,
      expandedHeight: isVisible ? 70 : 0,
    
    );
  }
}
