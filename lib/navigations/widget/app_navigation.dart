import 'package:go_router/go_router.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/navigations/screens/home/home_screen.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/app_routes.dart';
import 'package:mangakyy_v2_mobile/navigations/screens/chapter-detail/chapter_detail_screen.dart';
import 'package:mangakyy_v2_mobile/navigations/screens/comic-detail/comic_detail_screen.dart';

final appNavigation = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(path: AppRoutes.home, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: AppRoutes.comic,
      builder: (context, state) {
        final comic = state.extra as ComicModel;
        return ComicDetailScreen(comic: comic);
      },
    ),
    GoRoute(
      path: AppRoutes.chapter,
      builder: (context, state) {
        return ChapterDetailScreen();
      },
    ),
  ],
);
