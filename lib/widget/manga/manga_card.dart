
import 'package:flutter/material.dart';
import 'package:mobile/core/colors/app_color.dart';

class MangaCard extends StatelessWidget {
  final Map<String, dynamic> manga;
  const MangaCard({super.key, required this.manga});
  @override
  Widget build(BuildContext context) {
    return Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColor.card,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              manga["image"].toString(),
                              height: 100,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    height: 250,
                                    width: double.infinity,
                                    color: Colors.grey,
                                    child: Icon(Icons.error),
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          manga["title"].toString(),
                          style: TextStyle(
                            color: AppColor.text,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
  }
}