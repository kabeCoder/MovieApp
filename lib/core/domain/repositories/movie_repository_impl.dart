import 'package:movie_app/core/domain/models/movie.dart';
import 'package:movie_app/core/domain/repositories/base/movie_repository.dart';
import 'package:movie_app/core/domain/utils/enums/movies_filter.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';
import 'package:movie_app/core/service/movie_api_service.dart';

class MovieRepositoryImplementation implements MovieRepository {
  MovieRepositoryImplementation({
    required this.apiService,
  });

  final MovieApiService apiService;

  @override
  Future<ApiResult<List<MovieModel>>> getMovies(
    MoviesFilter moviesFilter,
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
}