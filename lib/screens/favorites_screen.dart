import 'package:flutter/material.dart';
import 'package:movie_app/constants/MyAppIcons.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Movies"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                MyappIcons.delete,
                color: Colors.red,
              ),
            ),

          ],
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
              return Text("data");//MoviesWidget();
            })
    );
  }
}
