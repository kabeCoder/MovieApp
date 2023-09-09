import 'package:auto_route/auto_route.dart';
import 'package:movie_app/features/Navigation/presentation/screens/navigation_screen.dart';
import 'package:movie_app/features/coming_soon/presentation/screens/coming_soon_screen.dart';
import 'package:movie_app/features/download/presentation/screens/download_screen.dart';
import 'package:movie_app/features/home/presentation/screens/home_screen.dart';
import 'package:movie_app/features/home/presentation/screens/movies_screen.dart';
import 'package:movie_app/features/home/presentation/screens/my_list_screen.dart';
import 'package:movie_app/features/home/presentation/screens/tv_shows_screen.dart';
import 'package:movie_app/features/more/presentation/screens/more_screen.dart';
import 'package:movie_app/features/search/presentation/screens/search_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              children: [
                AutoRoute(
                  page: TvShowsRoute.page,
                ),
                AutoRoute(
                  page: MoviesRoute.page,
                ),
                AutoRoute(
                  page: MyListRoute.page,
                ),
              ],
            ),
            AutoRoute(
              page: SearchRoute.page,
            ),
            AutoRoute(
              page: ComingSoonRoute.page,
            ),
            AutoRoute(
              page: DownloadRoute.page,
            ),
            AutoRoute(
              page: MoreRoute.page,
            ),
          ],
        ),
      ];
}
