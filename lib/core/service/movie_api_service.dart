import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/data/models/movie_response_dto.dart';
import 'package:movie_app/core/domain/utils/enums/movies_filter.dart';
import 'package:movie_app/core/service/base/base_api_repository.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';

class MovieApiService extends BaseApiRepository {
  Future<ApiResult<List<MovieResponseDto>>> getMovies(
    MoviesFilter moviesFilter,
  ) {
    final String path = _getPathForFilter(moviesFilter);

    final uri = Uri.parse(
      '${Env.baseUrl}$path?api_key=${Env.tmdbApiKey}',
    );

    return serviceCall<List<MovieResponseDto>>(
      () async {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          final List<dynamic> results = jsonData['results'] ?? [];
          final List<MovieResponseDto> movieDtos = results.map((dynamic item) => MovieResponseDto.fromJson(item as Map<String, dynamic>)).toList();
          return movieDtos;
        } else {
          throw Exception('HTTP Error: ${response.statusCode}');
        }
      },
    );
  }

  String _getPathForFilter(MoviesFilter filter) {
    switch (filter) {
      case MoviesFilter.popular:
        return '/3/movie/popular';
      case MoviesFilter.nowPlaying:
        return '/3/movie/now_playing';
      case MoviesFilter.upcoming:
        return '/3/movie/upcoming';
      case MoviesFilter.topRated:
        return '/3/movie/top_rated';
      case MoviesFilter.discover:
        return '/3/discover/movie';
      default:
        throw Exception('Invalid filter');
    }
  }
}
