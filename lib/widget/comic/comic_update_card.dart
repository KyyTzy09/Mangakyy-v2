import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';

class ComicUpdateCard extends StatelessWidget {
  final ComicModel comic;
  const ComicUpdateCard({super.key, required this.comic});

  @override
  build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black, Colors.black.withAlpha(200), AppColor.primary],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        spacing: 10,
        children: [
          //  Comic Image and Year
          Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(comic.image ?? "", fit: BoxFit.cover),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "2025",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth < 600 ? 12 : 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Comic Information
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Text(
                  comic.title ?? "",
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 16 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  comic.description ?? "",
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 12 : 14,
                    color: Colors.white70,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                // Rating, Views, and Bookmarks
                Wrap(
                  spacing: 8,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 2,
                      children: [
                        Icon(
                          Icons.star_outline,
                          color: Colors.yellow,
                          size: screenWidth < 600 ? 14 : 20,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth < 600 ? 12 : 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 2,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.blue,
                          size: screenWidth < 600 ? 14 : 20,
                        ),
                        Text(
                          "123.400",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth < 600 ? 12 : 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 2,
                      children: [
                        Icon(
                          Icons.bookmark_outline,
                          color: Colors.deepPurple,
                          size: screenWidth < 600 ? 14 : 20,
                        ),
                        Text(
                          "10.000",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth < 600 ? 12 : 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Genres
                Wrap(
                  spacing: 5,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Action",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth < 600 ? 10 : 12,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Action",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth < 600 ? 10 : 12,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Action",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth < 600 ? 10 : 12,
                        ),
                      ),
                    ),
                  ],
                ),
                // Country & Last Updated
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.flag_circle_outlined,
                          color: AppColor.primary,
                          size: screenWidth < 600 ? 10 : 14,
                        ),
                        Text(
                          "Korea Selatan",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontSize: screenWidth < 600 ? 10 : 14,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.white70,
                          size: screenWidth < 600 ? 10 : 14,
                        ),
                        Text(
                          "2 days ago",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth < 600 ? 10 : 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
