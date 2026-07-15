import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/chapter/chapter_card.dart';
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
              SliverFillRemaining(hasScrollBody: false, child: ComicContent()),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColor.primary, width: 1),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Chapter List",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ChapterCard();
                }, childCount: 20),
              ),
            ],
          );
        },
      ),
    );
  }
}
