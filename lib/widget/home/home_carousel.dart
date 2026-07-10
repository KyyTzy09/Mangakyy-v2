import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/common/models/comic_model.dart';
import 'package:mobile/core/colors/app_color.dart';
import 'package:mobile/widget/home/home_carousel_card.dart';

class HomeCarousel extends StatefulWidget {
  final List<ComicModel> comicList;
  const HomeCarousel({super.key, required this.comicList});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  late List<ComicModel> comicList;
  late Timer _timer;
  late PageController _pageController;
  late int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    comicList = widget.comicList;
    _pageController = PageController(viewportFraction: 1);
    startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void handlePageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void handlePageChanger(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void startAutoScroll() {
    _timer = Timer.periodic(Duration(milliseconds: 4000), (Timer timer) {
      if (_currentPage < comicList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        handlePageChanger(_currentPage);
      }
    });
  }

  @override
  Widget build(context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: comicList.length,
            onPageChanged: handlePageChanged,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final comic = comicList[index];
              return HomeCarouselCard(imageUrl: comic.image ?? "");
            },
          ),
          Positioned(
            bottom: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                comicList.length,
                (index) => GestureDetector(
                  onLongPress: () => _timer.cancel(),
                  onLongPressUp: () => startAutoScroll(),
                  onTap: () => handlePageChanger(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColor.primary
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
