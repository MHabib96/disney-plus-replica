import 'package:disney_plus_replica/bindings.dart';
import 'package:disney_plus_replica/src/modules/movie/view_models/movie_view_model.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_movie_repository.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_play_button_with_status.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_runtime_information.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_streaming_information.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_tabs.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_utility_buttons.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_wallpaper.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key, required this.viewModel});

  final MovieViewModel viewModel;
  final _movieRepository = services.get<IMovieRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Wrap(
          spacing: 5,
          children: [
            const _MovieFloatingActionButton(
              icon: Icons.file_upload_outlined,
              backgroundColor: Colors.transparent,
            ),
            _MovieFloatingActionButton(
              icon: Icons.clear_rounded,
              backgroundColor: Colors.black.withOpacity(0.5),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            MovieWallpaper(
              logoImagePath: viewModel.movie.logoImagePath,
              backgroundImagePath: viewModel.movie.selectedImagePath,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  MovieStreamingInformation(
                    rating: viewModel.movie.rating.name,
                  ),
                  const SizedBox(height: 4),
                  MovieRuntimeInformation(
                    releaseDate: viewModel.movie.releaseDate,
                    duration: viewModel.movie.duration,
                    genres: viewModel.movie.genres,
                  ),
                  const SizedBox(height: 10),
                  MoviePlayButtonWithStatus(
                    duration: viewModel.movie.duration,
                    watched: viewModel.movie.watched,
                  ),
                  const SizedBox(height: 10),
                  const MovieUtilityButtons(),
                  const SizedBox(height: 15),
                  Text(
                    viewModel.movie.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 30),
                  MovieTabs(
                    selectedMovie: viewModel.movie,
                    suggestedMovies: _movieRepository.getSuggestedMovies(viewModel.movie, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieFloatingActionButton extends StatelessWidget {
  const _MovieFloatingActionButton({
    required this.icon,
    required this.backgroundColor,
    this.onPressed,
  });

  final IconData icon;
  final Color backgroundColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: FittedBox(
        child: FloatingActionButton(
          mini: true,
          shape: const CircleBorder(),
          backgroundColor: backgroundColor,
          onPressed: onPressed ?? () {},
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
