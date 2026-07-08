import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile/core/colors/app_color.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.network(
                "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey, child: Icon(Icons.error)),
              ),
            ),
          ),
          Container(
            height: 200,
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Row(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
                      width: 100,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 100,
                        height: double.infinity,
                        color: Colors.grey,
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "ITSUKA KOTORI",
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          "Ini adalah my wife woi, tolong jangan di klaim!!",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withAlpha(110),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColor.border),
                              ),
                              child: Text(
                                "Action",
                                style: TextStyle(
                                  color: AppColor.text,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
