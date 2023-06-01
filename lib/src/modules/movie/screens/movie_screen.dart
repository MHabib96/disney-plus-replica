import 'package:disney_plus_replica/src/modules/movie/view_models/movie_view_model.dart';
import 'package:flutter/widgets.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.viewModel});

  final MovieViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Text('Movie Screen: ${viewModel.movie.title}');
  }
}
