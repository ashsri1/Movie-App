

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/constants/MyAppIcons.dart';
import 'package:movie_app/view-model/theme_provider.dart';
import 'package:provider/provider.dart';
import '../constants/my_theme_data.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../view-model/movies_provider.dart';
import '../widgets/movies/movies_widget.dart';
import 'favorites_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              // getIt<NavigationService>().showSnackbar();
              // getIt<NavigationService>().showDialog(MoviesWidget());
              getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(
              MyappIcons.favouriteRounded,
              color: Colors.red,
            ),
          ),
          Consumer(
            builder: (context ,ThemeProvider themeProvider,child ) {
              log("build");
              return IconButton(
                onPressed: () async {
                  themeProvider.toggleTheme();
                  // final List<MovieModel> movies = await getIt<ApiService>().fetchMovies();
                  // log("movies $movies");
                  // final List<MoviesGenre> genres =
                  //     await getIt<MoviesRepository>().fetchGenres();
                  // await getIt<ApiService>().fetchGenres();

                  // log("Genres are $genres");
                },
                icon: Icon(
                  themeProvider.themeData == MyThemeData.dark
                      ?MyappIcons.darkMode
                      : MyappIcons.lightMode,
                ),
              );
            }
          ),
        ],
      ),
      body: Consumer(builder: (context, MoviesProvider moviesProvider, child) {
        if (moviesProvider.isLoading && moviesProvider.moviesList.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (moviesProvider.fetchMoviesError.isNotEmpty) {
          return Center(child: Text(moviesProvider.fetchMoviesError));
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent &&
                !moviesProvider.isLoading) {
              moviesProvider.getMovies();
              return true;
            }
            return false;
          },
          child: ListView.builder(
            itemCount: moviesProvider.moviesList.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: moviesProvider.moviesList[index],
                  child: const MoviesWidget());
            },
          ),
        );
      }),
    );
  }
}
