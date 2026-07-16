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
          return SafeArea(
            top: false,
            
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.primary.withAlpha(30),
                    AppColor.primary.withAlpha(30),
                    Colors.blue[900]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: CustomScrollView(
                scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // Ini Header
                  ComicHeader(comic: comic),
                  // Ini Content
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: ComicContent(),
                  ),
                  // Ini Chapter List
                  SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColor.primary, width: 1),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
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
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  // Ini Pagination
                  SliverToBoxAdapter(
                    child: Row(
                      spacing: screenWidth * 0.02,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.02,
                              horizontal: screenWidth * 0.04,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.02,
                            horizontal: screenWidth * 0.04,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.primary),
                          ),
                          child: Text(
                            "1 / 20",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.02,
                              horizontal: screenWidth * 0.04,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: screenWidth * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
