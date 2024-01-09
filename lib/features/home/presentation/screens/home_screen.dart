import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/features/common_widgets/common_tab_bar.dart';
import 'package:movie_app/features/home/presentation/screens/categories_screen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonTabBar(
      tabRoutes: const [
        TvShowsRoute(),
        MoviesRoute(),
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
          child: GestureDetector(
            onTap: () => _onTap(context),
            child: Text(
              context.l10n.label_categories,
            ),
          ),
        ),
      ],
      dividerColor: Colors.transparent,
      labelStyle: TextStyles.bodyText2,
      unselectedLabelColor: ColorConstants.deepPurpleLight,
      unselectedLabelStyle: TextStyles.bodyText2,
    );
  }

  void _onTap(BuildContext context) {
    showFlexibleBottomSheet(
        context: context,
        builder: (context, scrollController, bottomSheetOffset) {
          return const CategoriesScreen();
        },
        minHeight: 0,
        initHeight: 1,
        maxHeight: 1,
        isExpand: true,
        bottomSheetColor: Colors.deepPurple.withOpacity(0.2));
  }
}
