import 'package:disney_plus_replica/src/modules/movie/view_models/movie_view_model.dart';
import 'package:disney_plus_replica/src/shared/models/movie.dart';
import 'package:disney_plus_replica/src/shared/routing/routes.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
    required this.movies,
    this.label,
    this.movieHeight = 130,
  });

  final List<Movie> movies;
  final String? label;
  final double movieHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 20),
              child: Text(
                label!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: movieHeight,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: movies.length,
              separatorBuilder: (context, index) => const Divider(indent: 8),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    HomeRoutes.movie.route,
                    arguments: MovieViewModel(movie: movies[index]),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(movies[index].browseImagePath),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
