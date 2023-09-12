import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Details',
          style: TextStyles.bodyText1,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: ColorConstants.deepPurpleLight,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                AppCachedNetworkImage(
                  imageUrl: movie.backdropUrl,
                  opacity: 0.4,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Overview: ',
                style: TextStyles.bodyText1.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movie.description,
                style: TextStyles.bodyText2.copyWith(
                  fontSize: 12,
                  color: ColorConstants.deepPurpleLight,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
