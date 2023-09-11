import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';

abstract class MovieRepository {
  Future<ApiResult<List<MovieModel>>> getMovies(
    TmdbFilter moviesFilter,
  );
}
