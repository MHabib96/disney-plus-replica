import 'package:disney_plus_replica/src/modules/movie/view_models/movie_view_model.dart';
import 'package:disney_plus_replica/src/shared/models/movie.dart';
import 'package:disney_plus_replica/src/shared/routing/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HighlightCarousel extends StatelessWidget {
  const HighlightCarousel({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 4 / 2,
        viewportFraction: 0.92,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 8),
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      items: [
        for (var movie in movies) ...[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: _CarouselSlide(movie: movie))
        ],
      ],
    );
  }
}

class _CarouselSlide extends StatelessWidget {
  const _CarouselSlide({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        HomeRoutes.movie.route,
        arguments: MovieViewModel(movie: movie),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(movie.highlightImagePath!, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
