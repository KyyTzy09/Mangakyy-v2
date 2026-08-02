import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/chapter/chapter_bottom.dart';

class HomeSwitcher extends StatefulWidget {
  const HomeSwitcher({super.key});

  @override
  State<HomeSwitcher> createState() => _HomeSwitcherState();
}

class _HomeSwitcherState extends State<HomeSwitcher> {
  final List<String> items = ["Manga", "Manhwa", "Manhua"];

  String _selectedValue = "Manga";

  void _onItemTapped(String v) {
    setState(() {
      _selectedValue = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 290, // Set the width to 90% of the screen width
      decoration: BoxDecoration(
        color: AppColor.border,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          items.length,
          (index) => GestureDetector(
            onTap: () => _onItemTapped(items[index]),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _selectedValue == items[index]
                    ? Colors.blue
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                items[index],
                style: TextStyle(
                  color: _selectedValue == items[index]
                      ? Colors.white
                      : Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
