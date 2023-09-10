import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/models/movie.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 4, right: 8),
        child: Transform.scale(
          scale: 2,
          child: AppCachedNetworkImage(
            imageUrl: movie.posterUrl,
          ),
        ),
      ),
      title: Text(
        movie.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 218, 237),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              movie.releaseDate.year.toString(),
            ),
          ),
          Text(
            movie.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      onTap: () {},
    );
  }

  // void _onTap(BuildContext context) => context.pushRoute(
  //       MovieDetailsRoute(
  //         movie: movie,
  //       ),
  //     );
}
