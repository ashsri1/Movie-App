import 'package:movie_app/models/movies_genres.dart';

import '../repository/movies_repo.dart';
import '../service/init_getit.dart';



class GenreUtils {
  static List<MoviesGenres> movieGenresNames(List<int> genreIds) {
    final moviesRepository = getIt<MoviesRepository>();
    final cachedGenres = moviesRepository.cachedGenres;
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
