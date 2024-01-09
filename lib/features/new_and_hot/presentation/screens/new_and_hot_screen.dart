import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/features/new_and_hot/presentation/widgets/new_and_hot_tmdb_vertical_list_view.dart';

@RoutePage()
class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.l10n.label_new_and_hot,
            style: const TextStyle(
              color: ColorConstants.deepPurpleLight,
            ),
          ),
        ),
      ),
      body: const NewAndHotTmdbVerticalListView(),
    );
  }
}
