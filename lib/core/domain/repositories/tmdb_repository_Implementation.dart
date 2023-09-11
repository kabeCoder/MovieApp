import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
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
      // Handle exceptions (e.g., network errors) here and return an error ApiResult

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
      // Handle exceptions (e.g., network errors) here and return an error ApiResult

      return ApiResult<List<TvShowModel>>(
        error: 'Network Error: $e',
      );
    }
  }
}
