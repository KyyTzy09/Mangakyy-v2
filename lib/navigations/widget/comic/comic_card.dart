import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';

class ComicCard extends StatefulWidget {
  final ComicModel comic;
  const ComicCard({super.key, required this.comic});

  @override
  State<ComicCard> createState() => _ComicCardState();
}

class _ComicCardState extends State<ComicCard> {
  late ComicModel comic;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    comic = widget.comic;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          context.go('/comic-detail', extra: comic);
        },
        splashColor: AppColor.primary..withValues(alpha: 30),
        child: MouseRegion(
          onEnter: (event) => setState(() => _isHovering = true),
          onExit: (event) => setState(() => _isHovering = false),
          cursor: SystemMouseCursors.click,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            spacing: 2,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: AnimatedScale(
                          scale: _isHovering ? 1.1 : 1.0,
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 200),
                          child: Image.network(
                            comic.image ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: Icon(Icons.broken_image),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.darken,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "KR",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "0.0",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedDefaultTextStyle(
                                  duration: Duration(milliseconds: 200),
                                  style: TextStyle(
                                    color: _isHovering
                                        ? AppColor.primary
                                        : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  child: Text(
                                    comic.title ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColor.text,
                                      fontSize: width < 400 ? 12 : 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  comic.chapter ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColor.text.withValues(alpha: 110),
                                    fontSize: width < 300 ? 10 : 12,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 3,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: AppColor.primary,
                        size: width < 300 ? 10 : width < 600 ? 12 : 14,
                      ),
                      Text(
                        "10 min ago",
                        style: TextStyle(
                          color: AppColor.text.withValues(alpha: 110),
                          fontWeight: FontWeight.w100,
                          fontSize: width < 300 ? 8 : 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
