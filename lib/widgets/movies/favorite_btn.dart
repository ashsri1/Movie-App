import 'package:flutter/material.dart';
import 'package:movie_app/constants/MyAppIcons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:provider/provider.dart';

import '../../view-model/favorite_provider.dart';


class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, FavoritesProvider favoritesProvider, _) {
      return IconButton(
        onPressed: () {
          favoritesProvider.addOrRemoveFromFavorites(movieModel);
        },
      icon:   Icon(
        favoritesProvider.isFavorite(movieModel)
            ? MyappIcons.favouriteRounded
            : MyappIcons.favoriteOutlineRounded,
        color: favoritesProvider.isFavorite(movieModel) ? Colors.red : null,
        size: 20,
      ),

      );
    });
  }
}