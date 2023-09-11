import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';

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
            leading: Image.asset('assets/images/netflix.png'),
            title: TabBar(
              controller: controller,
              tabs: [
                Tab(
                  text: context.l10n.label_tv_shows,
                ),
                Tab(
                  text: context.l10n.label_movies,
                ),
                Tab(
                  text: context.l10n.label_my_list,
                ),
              ],
              dividerColor: Colors.transparent,
              labelStyle: TextStyles.bodyText2,
              unselectedLabelColor: ColorConstants.deepPurpleLight,
              unselectedLabelStyle: TextStyles.bodyText2,
            ),
          ),
          body: child,
        );
      },
    );
  }
}
