import 'package:flutter/material.dart';
import 'package:movie_app/features/new_and_hot/presentation/widgets/new_and_hot_provider.dart';
import 'package:movie_app/features/new_and_hot/presentation/widgets/tmdb_vertical_list_view.dart';

class NewAndHotTmdbVerticalListView extends StatelessWidget {
  const NewAndHotTmdbVerticalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NewAndHotBlocProvider(
            timeWindow: "today",
            child: const TmdbVerticalListView(),
          ),
        ],
      ),
    );
  }
}
