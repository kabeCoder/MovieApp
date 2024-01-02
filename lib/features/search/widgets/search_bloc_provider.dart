// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/search_bloc/search_bloc.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';

class SearchBlocProvider extends StatelessWidget {
  const SearchBlocProvider({
    Key? key,
    required this.child,
    required this.tmdbQuery,
  }) : super(key: key);

  final Widget child;
  final String tmdbQuery;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: tmdbQuery.isNotEmpty ? Key(tmdbQuery) : null,
      create: (context) => SearchBloc(
        searchRepositoryImplementation: context.read<TmdbRepositoryImplementation>(),
      )..add(SearchEvent.getSearch(tmdbQuery)),
      child: child,
    );
  }
}
