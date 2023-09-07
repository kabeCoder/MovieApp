import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(context.topRoute.name),
            leading: const AutoLeadingButton(),
            bottom: TabBar(
              controller: controller,
              tabs: const [
                Tab(
                  text: 'TV Shows',
                  icon: Icon(Icons.abc),
                ),
                Tab(
                  text: 'Movies',
                  icon: Icon(Icons.abc),
                ),
                Tab(
                  text: 'My List',
                  icon: Icon(Icons.abc),
                ),
              ],
            ),
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
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
          ),
        );
      },
    );
  }
}
