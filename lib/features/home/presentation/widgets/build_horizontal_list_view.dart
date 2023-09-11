import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/tb_show_bloc/tv_show_bloc.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

class BuildHorizontalListView extends StatelessWidget {
  const BuildHorizontalListView({
    Key? key,
    required this.tmdbFilter,
    required this.child,
  }) : super(key: key);

  final TmdbFilter tmdbFilter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MovieBloc(
            movieRepositoryImplementation: context.read<TmdbRepositoryImplementation>(),
          )..add(
              MovieEvent.getMovies(tmdbFilter),
            ),
        ),
        BlocProvider(
          create: (context) => TvShowBloc(tvShowRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              TvShowEvent.getTvShows(tmdbFilter),
            ),
        ),
      ],
      child: child,
    );
  }
}
