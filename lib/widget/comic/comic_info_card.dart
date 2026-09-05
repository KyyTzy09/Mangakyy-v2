import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';

class ComicInfoCard extends StatelessWidget {
  final String title;
  final Icon icon;
  const ComicInfoCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize:
                  screenWidth * 0.035, // Adjust font size based on screen width
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
