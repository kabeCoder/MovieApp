import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/bloc/similar_movie_bloc/similar_movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/similar_tv_show_bloc/similar_tv_show_bloc.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/details/presentation/widgets/details_bloc_provider.dart';
import 'package:movie_app/features/common_widgets/common_text_view.dart';
import 'package:readmore/readmore.dart';

@RoutePage()
class MoreLikeThisScreen extends StatelessWidget {
  const MoreLikeThisScreen({
    super.key,
    required this.collection,
    required this.tmdbFilter,
    required this.tmdbId,
  });
  final String collection;
  final TmdbFilter tmdbFilter;
  final int tmdbId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (collection == context.l10n.collection_tv_show)
            DetailsBlocProvider(
              tmdbFilter: tmdbFilter,
              tvShowId: tmdbId,
              child: BlocConsumer<SimilarTvShowBloc, SimilarTvShowState>(
                listener: (context, state) => state.whenOrNull(
                  encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                    ),
                  ),
                ),
                builder: (_, state) => state.maybeWhen(
                  loadingSimilarTvShows: () => const Center(
                    child: AppCircularProgressIndicator(),
                  ),
                  loadedSimilarTvShows: (similarTvShows) => CommonTextView(
                    alignment: Alignment.centerLeft,
                    child: ReadMoreText(
                      similarTvShows.map((similarTvShow) => similarTvShow.name).join(', '),
                      trimLines: 2,
                      colorClickableText: ColorConstants.white1,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'more',
                      trimExpandedText: 'less',
                      style: TextStyles.bodyText2.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  orElse: SizedBox.shrink,
                ),
              ),
            ),
          if (collection == context.l10n.collection_movie)
            DetailsBlocProvider(
              tmdbFilter: tmdbFilter,
              movieId: tmdbId,
              child: BlocConsumer<SimilarMovieBloc, SimilarMovieState>(
                listener: (context, state) => state.whenOrNull(
                  encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                    ),
                  ),
                ),
                builder: (_, state) => state.maybeWhen(
                  loadingSimilarMovies: () => const Center(
                    child: AppCircularProgressIndicator(),
                  ),
                  loadedSimilarMovies: (similarMovies) => CommonTextView(
                    alignment: Alignment.centerLeft,
                    child: ReadMoreText(
                      similarMovies.map((similarMovie) => similarMovie.title).join(', '),
                      trimLines: 2,
                      colorClickableText: ColorConstants.white1,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'more',
                      trimExpandedText: 'less',
                      style: TextStyles.bodyText2.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  orElse: SizedBox.shrink,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
