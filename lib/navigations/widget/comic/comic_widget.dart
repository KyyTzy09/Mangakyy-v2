import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/comic/comic_content.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/comic/comic_header.dart';

class ComicWidget extends StatelessWidget {
  final ComicModel comic;
  const ComicWidget({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          return CustomScrollView(
            slivers: [
              ComicHeader(comic: comic),
              SliverFillRemaining(hasScrollBody: false, child: ComicContent(),),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColor.card,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chapter " + (index + 1).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          comic.description ?? "",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }, childCount: 20),
              ),
            ],
          );
        },
      ),
    );
  }
}
