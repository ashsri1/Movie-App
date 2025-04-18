import 'package:flutter/material.dart';
import 'package:movie_app/constants/MyAppIcons.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:provider/provider.dart';

import '../../models/movies_model.dart';
import '../../service/init_getit.dart';
import '../../service/navigation_service.dart';
import 'cached_image.dart';
import 'favorite_btn.dart';
import 'genres_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key,
 //   required this.movieModel
  });

 // final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    final moviesModelProvider = Provider.of<MovieModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            // TODO: Navigate To The Movie Details Screen
            getIt<NavigationService>().navigate(
              ChangeNotifierProvider.value(
                value: moviesModelProvider,
                child: const MovieDetailsScreen(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag:  moviesModelProvider.id,
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child:   CachedImageWidget(
                      imgUrl:
                      "https://image.tmdb.org/t/p/w500/${moviesModelProvider.backdropPath}",
                    ),
                                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(
                         moviesModelProvider.originalTitle,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                          Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text("${moviesModelProvider.voteAverage.toStringAsFixed(1)}/10"),

                          ],
                        ),
                        const SizedBox(height: 10),
                        // TODO: Add the genres widget
                          GenresListWidget(
                             movieModel: moviesModelProvider
                           ),

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              MyappIcons.watchLaterOutlined,
                              size: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 5),
                              Text(
                                 moviesModelProvider.releaseDate,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            // TODO: Add the favorite button
                             FavoriteBtn(
                                movieModel:moviesModelProvider
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
