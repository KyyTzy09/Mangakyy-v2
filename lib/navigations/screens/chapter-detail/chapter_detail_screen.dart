import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/widget/chapter/chapter_bottom.dart';
import 'package:mangakyy_v2_mobile/widget/chapter/chapter_top.dart';

class ChapterDetailScreen extends StatefulWidget {
  final ComicModel comic;
  const ChapterDetailScreen({super.key, required this.comic});

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> {
  late ScrollController _scrollController;
  late bool isVisibleBar = true;
  late double scrollSpeed;
  bool isAutoScroll = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
    scrollSpeed = 1.0;
  }

  void _hide() {
    setState(() {
      if (isVisibleBar) {
        isVisibleBar = false;
      }
    });
  }

  void _handleScroll() {
    switch (_scrollController.position.userScrollDirection) {
      case ScrollDirection.forward:
        _hide();
        break;
      case ScrollDirection.reverse:
        _hide();
        break;
      case ScrollDirection.idle:
        _hide();
        break;
    }
  }

  void _scrollToBottom() {
    int durationInMilliseconds = (50000 / scrollSpeed)
        .toInt(); // Adjust duration based on speed
    if (_scrollController.hasClients && isAutoScroll) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent, // Target: Bottom
        duration: Duration(
          milliseconds: durationInMilliseconds,
        ), // Duration based on speed
        curve: Curves.easeOut,
      );
    }
  }

  void _startAutoScroll() {
    setState(() {
      isAutoScroll = true;
    });
    _scrollToBottom();
  }

  void _stopAutoScroll() {
    setState(() {
      isAutoScroll = false;
    });
    _scrollController.animateTo(
      _scrollController.offset, // Stay at the current position
      duration: const Duration(milliseconds: 500), // Smooth stop
      curve: Curves.easeOut,
    );
  }

  void _setScrollSpeed(double value) {
    setState(() {
      scrollSpeed = value;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.background,
      body: Center(
        child: SafeArea(
          left: false,
          right: false,
          child: InkWell(
            onTap: () {
              setState(() {
                isVisibleBar = !isVisibleBar;
              });
              _stopAutoScroll();
            },
            child: Container(
              width: screenWidth < 600 ? screenWidth : 600,
              decoration: BoxDecoration(color: AppColor.background),
              child: Stack(
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Image.network(
                        "https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg",
                        width: double.infinity,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.grey,
                          child: Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ChapterTop(
                      isVisible: isVisibleBar,
                      comic: widget.comic,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ChapterBottom(
                      isVisible: isVisibleBar,
                      isAutoScroll: isAutoScroll,
                      scrollSpeed: scrollSpeed,
                      onSliderChange: _setScrollSpeed,
                      startAutoScroll: _startAutoScroll,
                      stopAutoScroll: _stopAutoScroll,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
