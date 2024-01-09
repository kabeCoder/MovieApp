import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/casts_bloc/casts_bloc.dart';
import 'package:movie_app/core/domain/bloc/genres_bloc/genres_bloc.dart';
import 'package:movie_app/core/domain/bloc/similar_movie_bloc/similar_movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/similar_tv_show_bloc/similar_tv_show_bloc.dart';
import 'package:movie_app/core/domain/bloc/video_bloc/video_bloc.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

// ignore: must_be_immutable
class DetailsBlocProvider extends StatelessWidget {
  DetailsBlocProvider({
    Key? key,
    required this.child,
    this.tmdbFilter,
    this.tmdbCastsId,
    this.tvShowId,
    this.movieId,
    this.tmdbVideoId,
  }) : super(key: key);

  final Widget child;
  TmdbFilter? tmdbFilter;
  int? tmdbCastsId;
  int? tvShowId;
  int? movieId;
  int? tmdbVideoId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CastsBloc(castsRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              CastsEvent.getCasts(tmdbFilter!, tmdbCastsId!),
            ),
        ),
        BlocProvider(
          create: (context) => GenresBloc(genresRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              GenresEvent.getGenres(tmdbFilter!),
            ),
        ),
        BlocProvider(
          create: (context) => SimilarTvShowBloc(similarTvShowsRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              SimilarTvShowEvent.getSimilarTvShows(tmdbFilter!, tvShowId!),
            ),
        ),
        BlocProvider(
          create: (context) => SimilarMovieBloc(similarMoviesRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              SimilarMovieEvent.getSimilarMovies(tmdbFilter!, movieId!),
            ),
        ),
        BlocProvider(
          create: (context) => VideoBloc(videoRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              VideoEvent.getVideos(tmdbFilter!, tmdbVideoId!),
            ),
        ),
      ],
      child: child,
    );
  }
}
