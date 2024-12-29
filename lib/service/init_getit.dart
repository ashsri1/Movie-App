

import 'package:get_it/get_it.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/service/navigation_service.dart';

import '../repository/movies_repo.dart';

  final  GetIt getIt=GetIt.instance;

void setupLocator(){

  getIt.registerLazySingleton<NavigationService>(()=>NavigationService());

  getIt.registerLazySingleton<ApiService>(()=>ApiService());

  getIt.registerLazySingleton<MoviesRepository>(
          () => MoviesRepository(getIt<ApiService>()));

}