import 'package:auto_route/auto_route.dart';
import 'package:movie_app/features/home/presentation/screens/home_screen.dart';
import 'package:movie_app/features/navigation/presentation/screens/navigation_screen.dart';

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
            ),
          ],
        ),
      ];
}
