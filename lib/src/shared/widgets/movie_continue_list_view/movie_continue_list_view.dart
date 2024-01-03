import 'package:disney_plus_replica/src/shared/models/movie.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_watch_status_bar.dart';
import 'package:flutter/material.dart';

part 'movie_continue_card.dart';

class MovieContinueListView extends StatelessWidget {
  const MovieContinueListView({
    super.key,
    required this.movies,
    this.height = 150,
  });

  final List<Movie> movies;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5, left: 20),
            child: Text(
              'Continue Watching',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: height,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: movies.length,
            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
            itemBuilder: (BuildContext context, int index) =>
                _MovieContinueCard(movie: movies[index], width: height * 1.75),
          ),
        ),
      ],
    );
  }
}
