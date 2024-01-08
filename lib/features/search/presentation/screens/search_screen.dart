import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/core/domain/bloc/search_bloc/search_bloc.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/search/widgets/search_bloc_provider.dart';
import 'package:movie_app/features/search/widgets/search_box.dart';
import 'package:movie_app/features/search/widgets/search_result.dart';
import 'package:movie_app/features/search/widgets/search_tmdb_vertical_list_view.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBox(
          onSearch: (query) {
            setState(() {
              searchController.text = query;
            });
          },
        ),
      ),
      body: Column(
        children: [
          SearchBlocProvider(
            tmdbQuery: searchController.text,
            child: BlocConsumer<SearchBloc, SearchState>(
              listener: (context, state) => state.whenOrNull(
                encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                  ),
                ),
              ),
              builder: (_, state) => state.maybeWhen(
                loadingSearch: () => const Center(
                  child: AppCircularProgressIndicator(),
                ),
                loadedSearch: (searchTvShowOrMovie) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Visibility(
                    visible: searchController.text.isNotEmpty,
                    child: Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        color: ColorConstants.grey1,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SearchResult(searchModel: searchTvShowOrMovie),
                    ),
                  ),
                ),
                orElse: SizedBox.shrink,
              ),
            ),
          ),
          const SearchTmdbVerticalListView(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
