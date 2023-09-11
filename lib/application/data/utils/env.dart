import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static const _baseUrl = 'BASE_URL';
  static const _baseImageUrl = 'BASE_IMAGE_URL';
  static const _baseImageBackdropUrl = 'BASE_IMAGE_BACKDROP_URL';
  static const _tmdbApiKey = 'TMDB_API_KEY';

  static final _env = dotenv.env;

  static final baseUrl = _env[_baseUrl];
  static final baseImageUrl = _env[_baseImageUrl];
  static final baseImageBackdropUrl = _env[_baseImageBackdropUrl];
  static final tmdbApiKey = _env[_tmdbApiKey];
}
