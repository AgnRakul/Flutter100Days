import 'dart:async';
import 'package:moviesdata/Src/models/item_model.dart';
import 'package:moviesdata/Src/models/trailer_model.dart';
import 'package:moviesdata/Src/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) =>
      moviesApiProvider.fetchTrailer(movieId);
}
