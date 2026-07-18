import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';

class ChapterBottom extends StatelessWidget {
  final bool isVisible;
  const ChapterBottom({super.key, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: isVisible ? 70 : 0,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.white.withOpacity(0.15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
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
                    icon: Icons.menu,
                    onPressed: () {
                      // Handle play action
                    },
                  ),
                  IconButtonWithBackground(
                    icon: Icons.play_arrow,
                    onPressed: () {
                      // Handle play action
                    },
                  ),
                  IconButtonWithBackground(
                    icon: Icons.chevron_right,
                    onPressed: () {
                      // Handle next chapter action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconButtonWithBackground extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const IconButtonWithBackground({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: IconButton(icon: Icon(icon), onPressed: onPressed),
    );
  }
}
