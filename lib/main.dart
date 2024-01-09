import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/service/tmdb_api_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await dotenv.load();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return RepositoryProvider(
      create: (_) => TmdbRepositoryImplementation(
        apiService: TmdbApiService(),
      ),
      child: MaterialApp.router(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: ColorConstants.black1,
          ),
          scaffoldBackgroundColor: ColorConstants.black1,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
