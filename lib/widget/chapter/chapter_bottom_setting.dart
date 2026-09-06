import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/widget/chapter/chapter_bottom.dart';

class ChapterBottomSetting extends StatelessWidget {
  const ChapterBottomSetting({
    super.key,
    required this.onTabSetting,
    this.onSliderChange,
    this.sliderValue = 1,
  });

  final double sliderValue;
  final Function(String) onTabSetting;
  final Function(double)? onSliderChange;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Slider(
            label: sliderValue.toStringAsFixed(1) + "x",
            divisions: 12,
            value: sliderValue,
            activeColor: AppColor.primary,
            inactiveColor: AppColor.primary.withOpacity(0.5),
            max: 2.0,
            min: 0.5,
            mouseCursor: SystemMouseCursors.click,
            onChanged: (value) {
              if (onSliderChange != null) {
                onSliderChange!(value);
              }
            },
          ),
        ),
        IconButtonWithBackground(
          icon: Icons.check,
          onPressed: () {
            onTabSetting.call("menu");
          },
        ),
      ],
    );
  }
}
