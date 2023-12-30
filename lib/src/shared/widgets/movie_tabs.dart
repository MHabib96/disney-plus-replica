import 'package:disney_plus_replica/src/modules/movie/view_models/movie_view_model.dart';
import 'package:disney_plus_replica/src/shared/helpers/format_helpers.dart';
import 'package:disney_plus_replica/src/shared/models/movie.dart';
import 'package:disney_plus_replica/src/shared/routing/routes.dart';
import 'package:disney_plus_replica/src/shared/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';

class MovieTabs extends StatefulWidget {
  const MovieTabs({
    super.key,
    required this.selectedMovie,
    required this.suggestedMovies,
  });

  final Movie selectedMovie;
  final List<Movie> suggestedMovies;

  @override
  State<StatefulWidget> createState() => _MovieTabs();
}

class _MovieTabs extends State<MovieTabs> {
  var selectedTab = MovieTabType.suggested;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _TabButton(
                tab: MovieTabType.suggested,
                selectedTab: selectedTab,
                onTap: () => setState(() => selectedTab = MovieTabType.suggested),
              ),
            ),
            Expanded(
              child: _TabButton(
                tab: MovieTabType.details,
                selectedTab: selectedTab,
                onTap: () => setState(() => selectedTab = MovieTabType.details),
              ),
            ),
          ],
        ),
        const Divider(
          height: 0,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        _MovieTabSelector(
          selectedTab: selectedTab,
          selectedMovie: widget.selectedMovie,
          suggestedMovies: widget.suggestedMovies,
        ),
      ],
    );
  }
}

enum MovieTabType { suggested, details }

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.tab,
    required this.selectedTab,
    required this.onTap,
  });

  final MovieTabType tab;
  final MovieTabType selectedTab;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              tab.name.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 15,
              ),
            ),
          ),
          Opacity(
            opacity: tab == selectedTab ? 1 : 0,
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieTabSelector extends StatelessWidget {
  final MovieTabType selectedTab;
  final Movie selectedMovie;
  final List<Movie> suggestedMovies;

  const _MovieTabSelector({
    required this.selectedTab,
    required this.selectedMovie,
    required this.suggestedMovies,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedTab) {
      case MovieTabType.suggested:
        return _SuggestedTab(suggestedMovies: suggestedMovies);
      case MovieTabType.details:
        return _DetailsTab(movie: selectedMovie);
    }
  }
}

class _SuggestedTab extends StatelessWidget {
  final List<Movie> suggestedMovies;

  const _SuggestedTab({required this.suggestedMovies});

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      crossAxisCount: 2,
      children: [
        for (final movie in suggestedMovies) ...[
          _SuggestedMovieButton(movie: movie),
        ],
      ],
    );
  }
}

class _SuggestedMovieButton extends StatelessWidget {
  final Movie movie;

  const _SuggestedMovieButton({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        HomeRoutes.movie.route,
        arguments: MovieViewModel(movie: movie),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(movie.browseImagePath),
        ),
      ),
    );
  }
}

class _DetailsTab extends StatelessWidget {
  final Movie movie;

  const _DetailsTab({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - (20 * 2);

    return SizedBox(
      width: _width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(movie.description),
          const SizedBox(height: 20),
          Text('Duration:\n${formatMovieDuration(movie.duration)}'),
          const SizedBox(height: 10),
          Text('Release date:\n${movie.releaseDate.year}'),
          const SizedBox(height: 10),
          Text('Genre:\n${formatGenres(movie.genres)}'),
          const SizedBox(height: 10),
          Text('Rating:\n${movie.rating.name}'),
          const SizedBox(height: 10),
          Text('Starring:\n${formatStarring(movie.starring)}'),
        ],
      ),
    );
  }
}
