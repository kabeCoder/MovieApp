import 'package:flutter/material.dart';

import 'package:movie_app/core/domain/models/movie.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

class MovieVerticalItem extends StatelessWidget {
  const MovieVerticalItem({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: SizedBox(
        width: 120,
        child: AppCachedNetworkImage(
          imageUrl: movie.posterUrl,
        ),
      ),
    );
  }
}
