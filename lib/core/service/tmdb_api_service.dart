import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/data/models/casts/casts_response_dto.dart';
import 'package:movie_app/core/data/models/genres/genres_dto.dart';
import 'package:movie_app/core/data/models/movie/movie_response_dto.dart';
import 'package:movie_app/core/data/models/tv_show/tv_show_response_dto.dart';
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

  Future<ApiResult<List<CastsResponseDto>>> getCasts(
    TmdbFilter tmdbCastsFilter,
    int tmdbCastsId,
  ) {
    final String path = _getTmdbCastsPathForFilter(tmdbCastsFilter, tmdbCastsId);

    final uri = Uri.parse(
      '${Env.baseUrl}$path?api_key=${Env.tmdbApiKey}',
    );

    return serviceCall<List<CastsResponseDto>>(
      () async {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          final List<dynamic> results = jsonData['cast'] ?? [];
          final List<CastsResponseDto> castsDto = results.map((dynamic item) => CastsResponseDto.fromJson(item as Map<String, dynamic>)).toList();

          return castsDto;
        } else {
          throw Exception('HTTP Error: ${response.statusCode}');
        }
      },
    );
  }

  Future<ApiResult<List<GenresResponseDto>>> getGenres(
    TmdbFilter tvShowGenresFilter,
  ) {
    final String path = _getTmdbGenrePathForFilter(tvShowGenresFilter);

    final uri = Uri.parse(
      '${Env.baseUrl}$path?api_key=${Env.tmdbApiKey}',
    );
    return serviceCall<List<GenresResponseDto>>(() async {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> results = jsonData['genres'] ?? [];
        final List<GenresResponseDto> genresDto = results.map((dynamic item) => GenresResponseDto.fromJson(item as Map<String, dynamic>)).toList();

        return genresDto;
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

  String _getTmdbGenrePathForFilter(TmdbFilter filter) {
    switch (filter) {
      case TmdbFilter.movie:
        return '/3/genre/movie/list';
      case TmdbFilter.tv:
        return '/3/genre/tv/list';
      default:
        throw Exception('Invalid genre filter');
    }
  }

  String _getTmdbCastsPathForFilter(
    TmdbFilter filter,
    int tmdbId,
  ) {
    switch (filter) {
      case TmdbFilter.movie:
        return '/3/movie/$tmdbId/credits';
      case TmdbFilter.tv:
        return '/3/tv/$tmdbId/credits';
      default:
        throw Exception('Invalid cast filter');
    }
  }
}
