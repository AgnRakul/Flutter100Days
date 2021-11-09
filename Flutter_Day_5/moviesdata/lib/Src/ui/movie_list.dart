// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:moviesdata/Src/blocs/movie_detail_bloc_provider.dart';
import 'package:moviesdata/Src/blocs/movies_bloc.dart';
import 'package:moviesdata/Src/ui/movie_detail.dart';
import '../models/item_model.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data!.results.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, index) {
        return GridTile(
          child: InkResponse(
            enableFeedback: true,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network(
                "https://image.tmdb.org/t/p/w185${snapshot.data!.results[index].poster_path}",
                fit: BoxFit.fill,
              ),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MovieDetailBlocProvider(
                        child: MovieDetail(
                            posterUrl:
                                snapshot.data!.results[index].backdrop_path,
                            description: snapshot.data!.results[index].overview,
                            releaseDate:
                                snapshot.data!.results[index].release_date,
                            title: snapshot.data!.results[index].title,
                            voteAverage: snapshot
                                .data!.results[index].vote_average
                                .toString(),
                            movieId: snapshot.data!.results[index].id));
                  },
                ),
              )
            },
          ),
        );
      },
    );
  }
}
