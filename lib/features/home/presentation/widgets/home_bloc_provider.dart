import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:movie_app/core/domain/bloc/tv_show_casts_bloc/tv_show_casts_bloc.dart';
import 'package:movie_app/core/domain/bloc/tv_show_genres/tv_show_genres_bloc.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

// ignore: must_be_immutable
class HomeBlocProvider extends StatelessWidget {
  HomeBlocProvider({
    Key? key,
    required this.child,
    this.tmdbFilter,
    this.seriesId,
  }) : super(key: key);

  final Widget child;
  TmdbFilter? tmdbFilter;
  int? seriesId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MovieBloc(
            movieRepositoryImplementation: context.read<TmdbRepositoryImplementation>(),
          )..add(
              MovieEvent.getMovies(tmdbFilter!),
            ),
        ),
        BlocProvider(
          create: (context) => TvShowBloc(tvShowRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              TvShowEvent.getTvShows(tmdbFilter!),
            ),
        ),
        BlocProvider(
          create: (context) => TvShowCastsBloc(tvShowCastsRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              TvShowCastsEvent.getTvShowCasts(seriesId!),
            ),
        ),
        BlocProvider(
          create: (context) => TvShowGenresBloc(tvShowGenresRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              TvShowGenresEvent.getTvShowGenres(tmdbFilter!),
            ),
        ),
      ],
      child: child,
    );
  }
}
