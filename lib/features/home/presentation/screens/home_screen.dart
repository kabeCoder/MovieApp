import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/features/home/presentation/widgets/common_tab_bar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonTabBar(
      tabRoutes: const [
        TvShowsRoute(),
        MoviesRoute(),
        MyListRoute(),
      ],
      leadingIcon: Image.asset('assets/images/netflix.png'),
      tabTexts: [
        Tab(
          child: Text(
            context.l10n.label_tv_shows,
            textAlign: TextAlign.center,
          ),
        ),
        Tab(
          child: Text(
            context.l10n.label_movies,
          ),
        ),
        Tab(
          child: Text(
            context.l10n.label_my_list,
          ),
        ),
      ],
      dividerColor: Colors.transparent,
      labelStyle: TextStyles.bodyText2,
      unselectedLabelColor: ColorConstants.deepPurpleLight,
      unselectedLabelStyle: TextStyles.bodyText2,
    );
  }
}
