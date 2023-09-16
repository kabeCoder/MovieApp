import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/data/models/movie/movie_response_dto.dart';
import 'package:movie_app/core/data/models/tv_show/tv_show_response_dto.dart';
import 'package:movie_app/core/data/models/tv_show_casts/tv_show_casts_response_dto.dart';
import 'package:movie_app/core/data/models/tv_show_genres/tv_show_genres_dto.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/service/base/base_api_repository.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';

class TmdbApiService extends BaseApiRepository {
  Future<ApiResult<List<MovieResponseDto>>> getMovies(
    TmdbFilter moviesFilter,
  ) {
    final String path = _getMoviePathForFilter(moviesFilter);

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

  Future<ApiResult<List<TvShowResponseDto>>> getTvShows(
    TmdbFilter tvShowsFilter,
  ) {
    final String path = _getTvShowPathForFilter(tvShowsFilter);

    final uri = Uri.parse(
      '${Env.baseUrl}$path?api_key=${Env.tmdbApiKey}',
    );

    return serviceCall<List<TvShowResponseDto>>(
      () async {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          final List<dynamic> results = jsonData['results'] ?? [];
          final List<TvShowResponseDto> tvShowDtos = results.map((dynamic item) => TvShowResponseDto.fromJson(item as Map<String, dynamic>)).toList();
          return tvShowDtos;
        } else {
          throw Exception('HTTP Error: ${response.statusCode}');
        }
      },
    );
  }

  Future<ApiResult<List<TvShowCastsResponseDto>>> getTvShowCasts(
    int seriesId,
  ) {
    final String path = '/3/tv/$seriesId/credits';

    final uri = Uri.parse(
      '${Env.baseUrl}$path?api_key=${Env.tmdbApiKey}',
    );

    return serviceCall<List<TvShowCastsResponseDto>>(
      () async {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          final List<dynamic> results = jsonData['cast'] ?? [];
          final List<TvShowCastsResponseDto> tvShowCastsDto =
              results.map((dynamic item) => TvShowCastsResponseDto.fromJson(item as Map<String, dynamic>)).toList();

          return tvShowCastsDto;
        } else {
          throw Exception('HTTP Error: ${response.statusCode}');
        }
      },
    );
  }

  Future<ApiResult<List<TvShowGenresResponseDto>>> getTvShowGenres(
    TmdbFilter tvShowGenresFilter,
  ) {
    final String path = _getTvShowGenrePathForFilter(tvShowGenresFilter);

    final uri = Uri.parse(
      '${Env.baseUrl}$path?api_key=${Env.tmdbApiKey}',
    );
    return serviceCall<List<TvShowGenresResponseDto>>(() async {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> results = jsonData['genres'] ?? [];
        final List<TvShowGenresResponseDto> tvShowGenresDto =
            results.map((dynamic item) => TvShowGenresResponseDto.fromJson(item as Map<String, dynamic>)).toList();

        return tvShowGenresDto;
      } else {
        throw Exception('HTTP Error: ${response.statusCode}');
      }
    });
  }

  String _getMoviePathForFilter(TmdbFilter filter) {
    switch (filter) {
      case TmdbFilter.popular:
        return '/3/movie/popular';
      case TmdbFilter.nowPlaying:
        return '/3/movie/now_playing';
      case TmdbFilter.upcoming:
        return '/3/movie/upcoming';
      case TmdbFilter.topRated:
        return '/3/movie/top_rated';
      default:
        throw Exception('Invalid filter');
    }
  }

  String _getTvShowPathForFilter(TmdbFilter filter) {
    switch (filter) {
      case TmdbFilter.popular:
        return '/3/tv/popular';
      case TmdbFilter.airingToday:
        return '/3/tv/airing_today';
      case TmdbFilter.onTheAir:
        return '/3/tv/on_the_air';
      case TmdbFilter.topRated:
        return '/3/tv/top_rated';
      default:
        throw Exception('Invalid tv filter');
    }
  }

  String _getTvShowGenrePathForFilter(TmdbFilter filter) {
    switch (filter) {
      case TmdbFilter.movie:
        return '/3/genre/movie/list';
      case TmdbFilter.tv:
        return '/3/genre/tv/list';
      default:
        throw Exception('Invalid genre filter');
    }
  }
}
