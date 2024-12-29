import 'package:flutter/material.dart';
import 'package:movie_app/constants/MyAppIcons.dart';
import 'package:movie_app/models/movies_model.dart';
class FavoriteBtn extends StatefulWidget {
  const FavoriteBtn({super.key, required this.movieModel});
final MovieModel movieModel;

  @override
  State<FavoriteBtn> createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  final favoriteMoviesIds=[];

  @override
  Widget build(BuildContext context) {
    bool isFavorite=favoriteMoviesIds.contains(widget.movieModel.id);
    return  IconButton(
      onPressed: () {
       if(isFavorite){
      favoriteMoviesIds.remove(widget.movieModel.id);
       }else{
         favoriteMoviesIds.add(widget.movieModel.id);
       }
       setState(() {

       });
      },
      icon:  Icon(
       isFavorite?MyappIcons.favorite: MyappIcons.favoriteOutlineRounded,
        color: isFavorite?Colors.red:null,
        size: 20,

      ),
    );
  }
}
