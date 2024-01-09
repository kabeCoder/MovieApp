import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';

// ignore: must_be_immutable
class AppCachedNetworkImage extends StatelessWidget {
  AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.opacity = 1.0,
    this.boxFit = BoxFit.cover,
  });

  final Uri imageUrl;
  final double opacity;
  BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: CachedNetworkImage(
        imageUrl: imageUrl.toString(),
        fit: boxFit,
        progressIndicatorBuilder: (_, __, downloadProgress) => AppCircularProgressIndicator(
          value: downloadProgress.progress,
        ),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
      ),
    );
  }
}
