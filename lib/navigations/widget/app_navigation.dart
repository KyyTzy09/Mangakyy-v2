import 'package:go_router/go_router.dart';
import 'package:mangakyy_v2_mobile/common/models/comic_model.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/app_routes.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/comic/comic_widget.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/home/home_widget.dart';

final AppNavigation = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      path: AppRoutes.comic,
      builder: (context, state) {
        final comic = state.extra as ComicModel;
        return ComicWidget(comic: comic);
      },
    ),
  ],
);
