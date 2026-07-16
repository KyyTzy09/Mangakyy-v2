import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/comic/comic_info_card.dart';

class ComicHeader extends StatelessWidget {
  final ComicModel comic;
  const ComicHeader({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SliverAppBar(
      expandedHeight: screenWidth * 1.2,
      pinned: true,
      floating: false,
      backgroundColor: AppColor.background.withAlpha(200),
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.go("/");
            },
          ),
          SizedBox(width: 8),
          Text(
            comic.title ?? "",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Image.network(
                  comic.image ?? "",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.grey,
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    AppColor.background.withAlpha(200),
                    AppColor.background,
                  ],
                ),
              ),
            ),
            // Info Section
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status Section
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColor.background,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.date_range,
                          color: AppColor.primary,
                          size: screenWidth * 0.04,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Ongoing",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    comic.title ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Info Section
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      ComicInfoCard(
                        title: "8.5",
                        icon: Icon(Icons.star, color: Colors.yellow, size: 16),
                      ),
                      ComicInfoCard(
                        title: "1.2M",
                        icon: Icon(
                          Icons.visibility,
                          color: Colors.green,
                          size: screenWidth * 0.04,
                        ),
                      ),
                      ComicInfoCard(
                        title: "Manga",
                        icon: Icon(
                          Icons.category,
                          color: AppColor.primary,
                          size: screenWidth * 0.04,
                        ),
                      ),
                      ComicInfoCard(
                        title: "43 Chapters",
                        icon: Icon(
                          Icons.menu_book,
                          color: Colors.red,
                          size: screenWidth * 0.04,
                        ),
                      ),
                    ],
                  ),
                  // Genre Section
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.background.withAlpha(200),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColor.primary, width: 1),
                        ),
                        child: Text(
                          "Action",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w100,
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
    );
  }
}
