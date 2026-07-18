import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/chapter/chapter_bottom.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/chapter/chapter_top.dart';

class ChapterWidget extends StatefulWidget {
  const ChapterWidget({super.key});

  @override
  State<ChapterWidget> createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends State<ChapterWidget> {
  late ScrollController _scrollController;
  late bool isVisibleBar = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  void _show() {
    setState(() {
      if (!isVisibleBar) {
        isVisibleBar = true;
      }
    });
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
        _show();
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
      backgroundColor: AppColor.background,
      bottomNavigationBar: ChapterBottom(isVisible: isVisibleBar),
      body: SafeArea(
        left: false,
        right: false,
        child: CustomScrollView(
          controller: _scrollController,
          scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
          physics: const BouncingScrollPhysics(),
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
      ),
    );
  }
}
