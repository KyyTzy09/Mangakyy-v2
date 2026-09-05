import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/widget/chapter/chapter_bottom_menu.dart';
import 'package:mangakyy_v2_mobile/widget/chapter/chapter_bottom_setting.dart';

class ChapterBottom extends StatefulWidget {
  final bool isVisible;
  final double scrollSpeed;
  final bool isAutoScroll;
  final Function(double) onSliderChange;
  final VoidCallback startAutoScroll;
  final VoidCallback stopAutoScroll;

  const ChapterBottom({
    super.key,
    this.isVisible = true,
    required this.isAutoScroll,
    required this.scrollSpeed,
    required this.onSliderChange,
    required this.startAutoScroll,
    required this.stopAutoScroll,
  });

  @override
  State<ChapterBottom> createState() => _ChapterBottomState();
}

class _ChapterBottomState extends State<ChapterBottom> {
  String tabMode = "menu";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleTabChange(String value) {
    setState(() {
      tabMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: widget.isVisible ? Offset.zero : const Offset(0, 1.0),
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
                child: tabMode != "setting"
                    ? ChapterBottomMenu(
                        isAutoScroll: widget.isAutoScroll,
                        onTabMenu: _handleTabChange,
                        startAutoScroll: widget.startAutoScroll,
                        stopAutoScroll: widget.stopAutoScroll,
                      )
                    : ChapterBottomSetting(
                        onTabSetting: _handleTabChange,
                        onSliderChange: widget.onSliderChange,
                        sliderValue: widget.scrollSpeed,
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
  const IconButtonWithBackground({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

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
