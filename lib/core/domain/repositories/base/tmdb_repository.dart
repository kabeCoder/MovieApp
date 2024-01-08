import 'package:movie_app/core/domain/models/casts/casts.dart';
import 'package:movie_app/core/domain/models/genres/genres.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/people/people.dart';
import 'package:movie_app/core/domain/models/search/search.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/domain/models/video/video.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';

abstract class TmdbRepository {
  Future<ApiResult<List<MovieModel>>> getMovies(
    TmdbFilter moviesFilter,
  );

  Future<ApiResult<List<TvShowModel>>> getTvShows(
    TmdbFilter tvShowsFilter,
  );

  Future<ApiResult<List<CastsModel>>> getCasts(
    TmdbFilter tmdbCastsFilter,
    int tmdbCastsId,
  );

  Future<ApiResult<List<GenresModel>>> getGenres(
    TmdbFilter tmdbGenresFilter,
  );

  Future<ApiResult<List<TvShowModel>>> getSimilarTvShows(
    TmdbFilter tmdbSimilarFilter,
    int tvShowId,
  );

  Future<ApiResult<List<MovieModel>>> getSimilarMovies(
    TmdbFilter tmdbSimilarFilter,
    int movieId,
  );

  Future<ApiResult<List<VideoModel>>> getVideo(
    TmdbFilter tmdbVideoFilter,
    int tmdbVideoId,
  );

  Future<ApiResult<List<SearchModel>>> getSearchTvShowOrMovie(
    String tmdbQuery,
  );

  Future<ApiResult<List<PeopleModel>>> getPeople(
    TmdbFilter tmdbTrendingFilter,
    String timeWindow,
  );
}
