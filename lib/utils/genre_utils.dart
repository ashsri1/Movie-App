import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/movies_genres.dart';
import 'package:provider/provider.dart';

import '../repository/movies_repo.dart';
import '../service/init_getit.dart';
import '../view-model/movies_provider.dart';



class GenreUtils {
  static List<MoviesGenres> movieGenresNames(List<int> genreIds,BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    final moviesRepository = getIt<MoviesRepository>();
    final cachedGenres = moviesProvider.genresList; //todo
    List<MoviesGenres> genresNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
            (g) => g.id == genreId,
        orElse: () => MoviesGenres(id: 5448484, name: 'Unknown'),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
