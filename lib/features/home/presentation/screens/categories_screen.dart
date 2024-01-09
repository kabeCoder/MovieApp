import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/bloc/genres_bloc/genres_bloc.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/widgets/home_bloc_provider.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBlocProvider(
        tmdbFilter: TmdbFilter.movie,
        child: BlocConsumer<GenresBloc, GenresState>(
          listener: (context, state) => state.whenOrNull(
            encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            ),
          ),
          builder: (_, state) => state.maybeWhen(
            loadingGenres: () => const Center(
              child: AppCircularProgressIndicator(),
            ),
            loadedGenres: (tmdbGenres) => Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  for (final tmdbGenre in tmdbGenres)
                    Text(
                      tmdbGenre.name,
                      style: TextStyles.headline2.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  const SizedBox(height: 50),
                  IconButton(
                    onPressed: () => context.popRoute(),
                    color: ColorConstants.white1,
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            ),
            orElse: SizedBox.shrink,
          ),
        ),
      ),
    );
  }
}
