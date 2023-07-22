import 'package:disney_plus_replica/src/modules/movie/view_models/movie_view_model.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_runtime_information.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_streaming_information.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_wallpaper.dart';
import 'package:disney_plus_replica/src/shared/widgets/multiple_floating_action_buttons.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.viewModel});

  final MovieViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: MultipleFloatingActionButtons(
        padding: const EdgeInsets.only(top: 5),
        floatingActionButtons: [
          FloatingActionButton(
            mini: true,
            splashColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            onPressed: () {},
            child: const Icon(Icons.file_upload_outlined),
          ),
          FloatingActionButton(
            mini: true,
            splashColor: Colors.transparent,
            backgroundColor: Colors.black.withOpacity(0.5),
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.clear_rounded),
          ),
        ],
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  MovieStreamingInformation(
                    rating: viewModel.movie.rating.name,
                  ),
                  const SizedBox(height: 2),
                  MovieRuntimeInformation(
                    releaseDate: viewModel.movie.releaseDate,
                    duration: viewModel.movie.duration,
                    genres: viewModel.movie.genres,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
