// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ComingSoonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ComingSoonScreen(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsScreen(
          key: args.key,
          collection: args.collection,
          movie: args.movie,
          tvShow: args.tvShow,
          multi: args.multi,
        ),
      );
    },
    DownloadRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DownloadScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MoreLikeThisRoute.name: (routeData) {
      final args = routeData.argsAs<MoreLikeThisRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MoreLikeThisScreen(
          key: args.key,
          collection: args.collection,
          tmdbFilter: args.tmdbFilter,
          tmdbId: args.tmdbId,
        ),
      );
    },
    MoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MoreScreen(),
      );
    },
    MoviesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MoviesScreen(),
      );
    },
    MyListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyListScreen(),
      );
    },
    NavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavigationScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    TvShowsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvShowsScreen(),
      );
    },
  };
}

/// generated route for
/// [ComingSoonScreen]
class ComingSoonRoute extends PageRouteInfo<void> {
  const ComingSoonRoute({List<PageRouteInfo>? children})
      : super(
          ComingSoonRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailsScreen]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    Key? key,
    required String collection,
    MovieModel? movie,
    TvShowModel? tvShow,
    SearchModel? multi,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            collection: collection,
            movie: movie,
            tvShow: tvShow,
            multi: multi,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<DetailsRouteArgs> page =
      PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.collection,
    this.movie,
    this.tvShow,
    this.multi,
  });

  final Key? key;

  final String collection;

  final MovieModel? movie;

  final TvShowModel? tvShow;

  final SearchModel? multi;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, collection: $collection, movie: $movie, tvShow: $tvShow, multi: $multi}';
  }
}

/// generated route for
/// [DownloadScreen]
class DownloadRoute extends PageRouteInfo<void> {
  const DownloadRoute({List<PageRouteInfo>? children})
      : super(
          DownloadRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownloadRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MoreLikeThisScreen]
class MoreLikeThisRoute extends PageRouteInfo<MoreLikeThisRouteArgs> {
  MoreLikeThisRoute({
    Key? key,
    required String collection,
    required TmdbFilter tmdbFilter,
    required int tmdbId,
    List<PageRouteInfo>? children,
  }) : super(
          MoreLikeThisRoute.name,
          args: MoreLikeThisRouteArgs(
            key: key,
            collection: collection,
            tmdbFilter: tmdbFilter,
            tmdbId: tmdbId,
          ),
          initialChildren: children,
        );

  static const String name = 'MoreLikeThisRoute';

  static const PageInfo<MoreLikeThisRouteArgs> page =
      PageInfo<MoreLikeThisRouteArgs>(name);
}

class MoreLikeThisRouteArgs {
  const MoreLikeThisRouteArgs({
    this.key,
    required this.collection,
    required this.tmdbFilter,
    required this.tmdbId,
  });

  final Key? key;

  final String collection;

  final TmdbFilter tmdbFilter;

  final int tmdbId;

  @override
  String toString() {
    return 'MoreLikeThisRouteArgs{key: $key, collection: $collection, tmdbFilter: $tmdbFilter, tmdbId: $tmdbId}';
  }
}

/// generated route for
/// [MoreScreen]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute({List<PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MoviesScreen]
class MoviesRoute extends PageRouteInfo<void> {
  const MoviesRoute({List<PageRouteInfo>? children})
      : super(
          MoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyListScreen]
class MyListRoute extends PageRouteInfo<void> {
  const MyListRoute({List<PageRouteInfo>? children})
      : super(
          MyListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NavigationScreen]
class NavigationRoute extends PageRouteInfo<void> {
  const NavigationRoute({List<PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvShowsScreen]
class TvShowsRoute extends PageRouteInfo<void> {
  const TvShowsRoute({List<PageRouteInfo>? children})
      : super(
          TvShowsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvShowsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
