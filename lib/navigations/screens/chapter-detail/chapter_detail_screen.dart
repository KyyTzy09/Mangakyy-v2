import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/chapter/chapter_bottom.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/chapter/chapter_top.dart';

class ChapterDetailScreen extends StatefulWidget {
  final ComicModel comic;
  const ChapterDetailScreen({super.key, required this.comic});

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> {
  late ScrollController _scrollController;
  late bool isVisibleBar = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
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
        setState(() {
          isVisibleBar = true;
        });
        break;
    }
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
      backgroundColor: Colors.transparent,
      body: SafeArea(
        left: false,
        right: false,
        child: InkWell(
          onTap: () {
            setState(() {
              isVisibleBar = !isVisibleBar;
            });
          },
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(color: AppColor.background),
            child: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Image.network(
                          'https://i.pinimg.com/736x/0d/8c/5b/0d8c5b8118f427939a12560cca76158e.jpg',
                          width: screenWidth > 600 ? 400 : screenWidth,
                        );
                      }),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ChapterTop(isVisible: isVisibleBar, comic: widget.comic),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ChapterBottom(isVisible: isVisibleBar),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
