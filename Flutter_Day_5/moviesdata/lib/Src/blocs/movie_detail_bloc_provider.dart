// ignore_for_file: avoid_renaming_method_parameters
import 'package:flutter/material.dart';
import 'package:moviesdata/Src/blocs/movie_detail-bloc.dart';
export 'package:moviesdata/Src/blocs/movie_detail-bloc.dart';

class MovieDetailBlocProvider extends InheritedWidget {
  final MovieDetailBloc bloc;

  MovieDetailBlocProvider({Key? key, required Widget child})
      : bloc = MovieDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static MovieDetailBloc of(BuildContext context) {
    return (context
                .dependOnInheritedWidgetOfExactType<MovieDetailBlocProvider>()
            as MovieDetailBlocProvider)
        .bloc;
  }
}
