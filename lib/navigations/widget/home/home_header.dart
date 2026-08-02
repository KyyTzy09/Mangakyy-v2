import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final Icon icon;
  final String title;

  const HomeHeader({Key? key, required this.icon, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      spacing: 8,
      mainAxisAlignment: screenWidth < 600 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        icon,
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
