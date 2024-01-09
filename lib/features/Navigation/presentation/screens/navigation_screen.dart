import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        NewAndHotRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: context.l10n.labe_home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: context.l10n.label_search,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.movie),
              label: context.l10n.label_whats_hot,
            ),
          ],
        );
      },
    );
  }
}
