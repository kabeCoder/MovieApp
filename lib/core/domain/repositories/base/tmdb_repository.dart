import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';

abstract class TmdbRepository {
  Future<ApiResult<List<MovieModel>>> getMovies(
    TmdbFilter moviesFilter,
  );

  Future<ApiResult<List<TvShowModel>>> getTvShows(
    TmdbFilter tvShowsFilter,
  );
}
