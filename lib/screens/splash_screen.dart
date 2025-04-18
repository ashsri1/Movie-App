import 'package:flutter/material.dart';
import 'package:movie_app/view-model/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../view-model/movies_provider.dart';
import '../widgets/movies/my_error_widget.dart';
import 'movie_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _loadInitialData(BuildContext context) async {
    await Future.microtask(() async {
      if (!context.mounted) return;
      await Provider.of<MoviesProvider>(context, listen: false).getMovies();
      if (!context.mounted) return;
      await Provider.of<FavoritesProvider>(context, listen: false).loadFavorites();
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await Provider.of<MoviesProvider>(context, listen: false).getMovies();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return Scaffold(
        body: FutureBuilder(
            future: _loadInitialData(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator.adaptive();
              } else if (snapshot.hasError) {
                if (moviesProvider.genresList.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    getIt<NavigationService>()
                        .navigateReplace(const MoviesScreen());
                  });
                }
                return Provider.of<MoviesProvider>(context).isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : MyErrorWidget(
                  errorText: snapshot.error.toString(),
                  retryFunction: () async {
                    await _loadInitialData(context);
                  },
                );
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  getIt<NavigationService>()
                      .navigateReplace(const MoviesScreen());
                });

                return const SizedBox.shrink();
              }
            }));
  }
}
