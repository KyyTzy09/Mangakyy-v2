import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';

class ChapterBottom extends StatelessWidget {
  final bool isVisible;
  const ChapterBottom({super.key, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSlide(
      offset: isVisible ? Offset.zero : const Offset(0, 1.0),
      duration: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
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
