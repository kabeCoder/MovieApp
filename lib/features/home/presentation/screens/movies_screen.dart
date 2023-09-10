import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/data/models/movie_response_dto.dart';
import 'package:movie_app/core/domain/utils/enums/movies_filter.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';
import 'package:movie_app/core/service/movies_api_service.dart';

@RoutePage()
class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late Future<ApiResult<List<MovieResponseDto>>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the Future to fetch movie data when the screen loads
    _moviesFuture = MoviesApiService().getMovies(MoviesFilter.popular);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<ApiResult<List<MovieResponseDto>>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('lodaing');
            // Show a loading indicator while fetching data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error.toString()}');
            // Handle API call error
            return Text('Error: ${snapshot.error.toString()}');
          } else if (!snapshot.hasData || snapshot.data!.data == null) {
            print('walang data');
            // Handle no data available
            return Text(
              'No data available.',
              style: TextStyle(color: Colors.white),
            );
          } else {
            // Display movie data
            final movies = snapshot.data!.data!;
            print('movies: $movies');
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  title: Text(
                    movie.title,
                    style: TextStyle(color: Colors.white),
                  ),
                  // Add more movie information as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
