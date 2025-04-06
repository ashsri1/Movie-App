import '../models/movies_genres.dart';
import '../models/movies_model.dart';
import '../service/api_service.dart';

class MoviesRepository {
final ApiService _apiService;
MoviesRepository(this._apiService);

Future<List<MovieModel>> fetchMovies({int page = 1}) async {
  return await _apiService.fetchMovies(page: page);
}
//List<MoviesGenres> cachedGenres=[];
Future<List<MoviesGenres>> fetchGenres() async {
 // return cachedGenres= await _apiService.fetchGenres();
  return  await _apiService.fetchGenres();
}
}
