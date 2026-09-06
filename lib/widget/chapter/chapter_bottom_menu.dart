import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/widget/chapter/chapter_bottom.dart';

class ChapterBottomMenu extends StatelessWidget {
  const ChapterBottomMenu({
    super.key,
    required this.onTabMenu,
    required this.isAutoScroll,
    required this.startAutoScroll,
    required this.stopAutoScroll,
  });

  final Function(String) onTabMenu;
  final bool isAutoScroll;
  final VoidCallback startAutoScroll;
  final VoidCallback stopAutoScroll;

  void _handleScrollChange() {
    if (isAutoScroll == true) {
      stopAutoScroll();
    } else {
      startAutoScroll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 5,
      children: [
        IconButtonWithBackground(
          icon: Icons.chevron_left,
          onPressed: () {
            // Handle previous chapter action
          },
        ),
        IconButtonWithBackground(
          icon: Icons.settings,
          onPressed: () {
            onTabMenu("setting");
          },
        ),
        IconButtonWithBackground(
          icon: isAutoScroll == true ? Icons.pause : Icons.play_arrow,
          onPressed: () {
            _handleScrollChange();
          },
        ),
        IconButtonWithBackground(
          icon: Icons.chevron_right,
          onPressed: () {
            // Handle next chapter action
          },
        ),
      ],
    );
  }
}
