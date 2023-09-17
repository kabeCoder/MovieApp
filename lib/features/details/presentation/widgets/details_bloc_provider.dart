import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/casts_bloc/casts_bloc.dart';
import 'package:movie_app/core/domain/bloc/genres_bloc/genres_bloc.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

// ignore: must_be_immutable
class DetailsBlocProvider extends StatelessWidget {
  DetailsBlocProvider({
    Key? key,
    required this.child,
    this.tmdbFilter,
    this.tmdbCastsId,
  }) : super(key: key);

  final Widget child;
  TmdbFilter? tmdbFilter;
  int? tmdbCastsId;

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
      ],
      child: child,
    );
  }
}
