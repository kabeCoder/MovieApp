import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        ComingSoonRoute(),
        DownloadRoute(),
        MoreRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Coming Soon',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Download',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More',
            ),
          ],
        );
      },
    );
  }
}
