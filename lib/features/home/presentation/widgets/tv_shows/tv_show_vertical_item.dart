import 'package:flutter/material.dart';

import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

class TvShowVerticalItem extends StatelessWidget {
  const TvShowVerticalItem({
    super.key,
    required this.tvShow,
  });

  final TvShowModel tvShow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: SizedBox(
        width: 120,
        child: AppCachedNetworkImage(
          imageUrl: tvShow.posterUrl,
        ),
      ),
    );
  }
}
