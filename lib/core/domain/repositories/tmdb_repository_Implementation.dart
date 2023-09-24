import 'package:movie_app/core/domain/models/casts/casts.dart';
import 'package:movie_app/core/domain/models/genres/genres.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/domain/models/video/video.dart';
import 'package:movie_app/core/domain/repositories/base/tmdb_repository.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';
import 'package:movie_app/core/service/tmdb_api_service.dart';

class TmdbRepositoryImplementation implements TmdbRepository {
  TmdbRepositoryImplementation({
    required this.apiService,
  });

  final TmdbApiService apiService;

  @override
  Future<ApiResult<List<MovieModel>>> getMovies(
    TmdbFilter moviesFilter,
  ) async {
    try {
      final response = await apiService.getMovies(moviesFilter);

      if (response.error != null) {
        return ApiResult<List<MovieModel>>(
          error: response.error,
        );
      }

      final List<MovieModel> movies = response.data?.map((dto) => dto.toDomain()).toList() ?? [];

      return ApiResult<List<MovieModel>>(
        data: movies,
        error: null,
      );
    } catch (e) {
      return ApiResult<List<MovieModel>>(
        error: 'Network Error: $e',
      );
    }
  }

  @override
  Future<ApiResult<List<TvShowModel>>> getTvShows(TmdbFilter tvShowsFilter) async {
    try {
      final response = await apiService.getTvShows(tvShowsFilter);

      if (response.error != null) {
        return ApiResult<List<TvShowModel>>(
          error: response.error,
        );
      }

      final List<TvShowModel> tvShows = response.data?.map((dto) => dto.toDomain()).toList() ?? [];

      return ApiResult<List<TvShowModel>>(
        data: tvShows,
        error: null,
      );
    } catch (e) {
      return ApiResult<List<TvShowModel>>(
        error: 'Network Error: $e',
      );
    }
  }

  @override
  Future<ApiResult<List<CastsModel>>> getCasts(
    TmdbFilter tmdbCastsFilter,
    int tmdbCastsId,
  ) async {
    try {
      final response = await apiService.getCasts(tmdbCastsFilter, tmdbCastsId);

      if (response.error != null) {
        return ApiResult<List<CastsModel>>(
          error: response.error,
        );
      }

      final List<CastsModel> casts = response.data?.map((dto) => dto.toDomain()).toList() ?? [];

      return ApiResult<List<CastsModel>>(
        data: casts,
        error: null,
      );
    } catch (e) {
      return ApiResult<List<CastsModel>>(
        error: 'Network Error: $e',
      );
    }
  }

  @override
  Future<ApiResult<List<GenresModel>>> getGenres(
    TmdbFilter tmdbGenresFilter,
  ) async {
    try {
      final response = await apiService.getGenres(tmdbGenresFilter);

      if (response.error != null) {
        return ApiResult<List<GenresModel>>(
          error: response.error,
        );
      }

      final List<GenresModel> genres = response.data?.map((dto) => dto.toDomain()).toList() ?? [];

      return ApiResult<List<GenresModel>>(
        data: genres,
        error: null,
      );
    } catch (e) {
      return ApiResult<List<GenresModel>>(
        error: 'Network Error: $e',
      );
    }
  }

  @override
  Future<ApiResult<List<TvShowModel>>> getSimilarTvShows(
    TmdbFilter tmdbSimilarFilter,
    int tvShowId,
  ) async {
    try {
      final response = await apiService.getSimilarTvShows(tmdbSimilarFilter, tvShowId);

      if (response.error != null) {
        return ApiResult<List<TvShowModel>>(
          error: response.error,
        );
      }

      final List<TvShowModel> similarTvhows = response.data?.map((dto) => dto.toDomain()).toList() ?? [];

      return ApiResult<List<TvShowModel>>(
        data: similarTvhows,
        error: null,
      );
    } catch (e) {
      return ApiResult<List<TvShowModel>>(
        error: 'Network Error: $e',
      );
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getSimilarMovies(TmdbFilter tmdbSimilarFilter, int movieId) async {
    try {
      final response = await apiService.getSimilarMovies(
        tmdbSimilarFilter,
        movieId,
      );

      if (response.error != null) {
        return ApiResult<List<MovieModel>>(
          error: response.error,
        );
      }

      final List<MovieModel> similarMovies = response.data?.map((dto) => dto.toDomain()).toList() ?? [];

      return ApiResult<List<MovieModel>>(
        data: similarMovies,
        error: null,
      );
    } catch (e) {
      return ApiResult<List<MovieModel>>(
        error: 'Network Error: $e',
      );
    }
  }

  @override
  Future<ApiResult<List<VideoModel>>> getVideo(
    TmdbFilter tmdbVideoFilter,
    int tmdbVideoId,
  ) async {
    try {
      final response = await apiService.getVideo(tmdbVideoFilter, tmdbVideoId);

      if (response.error != null) {
        return ApiResult<List<VideoModel>>(
          error: response.error,
        );
      }

      final List<VideoModel> video = response.data?.map((dto) => dto.toDomain()).toList() ?? [];

      return ApiResult<List<VideoModel>>(
        data: video,
        error: null,
      );
    } catch (e) {
      return ApiResult<List<VideoModel>>(
        error: 'Network Error: $e',
      );
    }
  }
}
