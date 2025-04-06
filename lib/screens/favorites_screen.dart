import 'package:flutter/material.dart';
import 'package:movie_app/constants/MyAppIcons.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';

import '../view-model/favorite_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Movies"),
          actions: [
            IconButton(
              onPressed: () {
                favoritesProvider.clearAllFavs();
              },
              icon: const Icon(
                MyappIcons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: favoritesProvider.favoritesList.isEmpty
            ?  Center(
                child: Text("No added Fav",style: TextStyle(fontWeight:FontWeight.bold,
                    fontSize: 30,
                    color:Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black, ),),
              )
            : ListView.builder(
                itemCount: favoritesProvider.favoritesList.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: favoritesProvider.favoritesList[index],
                      child: const MoviesWidget()); //Text("data");//
                }));
  }
}
