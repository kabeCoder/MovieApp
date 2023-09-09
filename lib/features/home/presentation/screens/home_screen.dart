import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        TvShowsRoute(),
        MoviesRoute(),
        MyListRoute(),
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.face,
              color: Colors.white,
            ),
            title: TabBar(
              controller: controller,
              tabs: const [
                Tab(
                  text: 'TV Shows',
                ),
                Tab(
                  text: 'Movies',
                ),
                Tab(
                  text: 'My List',
                ),
              ],
              dividerColor: Colors.transparent,
            ),
          ),
          body: child,
        );
      },
    );
  }
}
