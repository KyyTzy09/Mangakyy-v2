import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/home/home_carousel.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/home/home_header.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/comic/comic_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final List<ComicModel> comicList = [
      ComicModel(
        title: "Evernight honkai star rail",
        image:
            "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
        description:
            "Evernight is a girl who is a member of the Honkai Star Rail team. She is a skilled fighter and has a strong sense of justice.",
        type: "Action, Adventure",
        status: "Ongoing",
        chapter: "Chapter 1",
      ),
      ComicModel(
        title: "Evernight honkai star rail",
        image:
            "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
        description:
            "Evernight is a girl who is a member of the Honkai Star Rail team. She is a skilled fighter and has a strong sense of justice.",
        type: "Action, Adventure",
        status: "Ongoing",
        chapter: "Chapter 1",
      ),
      ComicModel(
        title: "Evernight honkai star rail",
        image:
            "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
        description:
            "Evernight is a girl who is a member of the Honkai Star Rail team. She is a skilled fighter and has a strong sense of justice.",
        type: "Action, Adventure",
        status: "Ongoing",
        chapter: "Chapter 1",
      ),
      ComicModel(
        title: "Evernight honkai star rail",
        image:
            "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
        description:
            "Evernight is a girl who is a member of the Honkai Star Rail team. She is a skilled fighter and has a strong sense of justice.",
        type: "Action, Adventure",
        status: "Ongoing",
        chapter: "Chapter 1",
      ),
      ComicModel(
        title: "Evernight honkai star rail",
        image:
            "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
        description:
            "Evernight is a girl who is a member of the Honkai Star Rail team. She is a skilled fighter and has a strong sense of justice.",
        type: "Action, Adventure",
        status: "Ongoing",
        chapter: "Chapter 1",
      ),
      ComicModel(
        title: "Evernight honkai star rail",
        image:
            "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
        description:
            "Evernight is a girl who is a member of the Honkai Star Rail team. She is a skilled fighter and has a strong sense of justice.",
        type: "Action, Adventure",
        status: "Ongoing",
        chapter: "Chapter 1",
      ),
      ComicModel(
        title: "Evernight honkai star rail",
        image:
            "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
        description:
            "Evernight is a girl who is a member of the Honkai Star Rail team. She is a skilled fighter and has a strong sense of justice.",
        type: "Action, Adventure",
        status: "Ongoing",
        chapter: "Chapter 1",
      ),
      ComicModel(
        title: "Evernight honkai star rail",
        image:
            "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
        description:
            "Evernight is a girl who is a member of the Honkai Star Rail team. She is a skilled fighter and has a strong sense of justice.",
        type: "Action, Adventure",
        status: "Ongoing",
        chapter: "Chapter 1",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: AppColor.border, height: 1),
        ),
        title: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "MANGA",
                    style: TextStyle(
                      color: AppColor.text,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "KYY",
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.history, color: Colors.white),
                    Text("History", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width < 600 ? 10 : 20),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeCarousel(comicList: comicList),
              // Recommended Section
              HomeHeader(
                icon: Icon(Icons.trending_up, color: Colors.red),
                title: "Recommended",
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  int columns = (constraints.maxWidth / 200).round();
                  final comic = comicList[0];

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width < 300
                          ? 2
                          : columns < 3
                          ? 3
                          : columns,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: columns < 3 ? 200 : 300,
                    ),
                    itemCount: comicList.length,
                    itemBuilder: (context, index) {
                      return ComicCard(comic: comic);
                    },
                  );
                },
              ),
              // Popular Section
              HomeHeader(
                icon: Icon(Icons.bookmark, color: Colors.amber),
                title: "Popular",
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: comicList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    ComicCard(comic: comicList[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
