import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/domain/models/tv_show_casts/tv_show_casts.dart';
import 'package:movie_app/core/domain/models/tv_show_genres/tv_show_genres.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';

abstract class TmdbRepository {
  Future<ApiResult<List<MovieModel>>> getMovies(
    TmdbFilter moviesFilter,
  );

  Future<ApiResult<List<TvShowModel>>> getTvShows(
    TmdbFilter tvShowsFilter,
  );

  Future<ApiResult<List<TvShowCastsModel>>> getTvShowCasts(
    int seriesId,
  );

  Future<ApiResult<List<TvShowGenresModel>>> getTvShowGenres(
    TmdbFilter tvShowGenresFilter,
  );
}
