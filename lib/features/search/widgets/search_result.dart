// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/core/domain/models/search/search.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
    required this.searchModel,
  }) : super(key: key);

  final List<SearchModel> searchModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchModel.length,
      itemBuilder: (context, index) {
        final item = searchModel[index];
        return ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
            child: AppCachedNetworkImage(imageUrl: item.backdropUrl),
          ),
          title: Text(
            item.name.isNotEmpty ? item.name : item.title,
            style: TextStyle(color: ColorConstants.deepPurpleLight),
          ),
        );
      },
    );
  }
}
