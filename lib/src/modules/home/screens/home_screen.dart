import 'package:disney_plus_replica/bindings.dart';
import 'package:disney_plus_replica/src/modules/home/slivers/sliver_home_app_bar.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_movie_repository.dart';
import 'package:disney_plus_replica/src/shared/types/category_type.dart';
import 'package:disney_plus_replica/src/shared/widgets/category_buttons.dart';
import 'package:disney_plus_replica/src/shared/widgets/highlight_carousel.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_continue_list_view/movie_continue_list_view.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _verticalSpacing = 15.0;
  final _horizontalSpacing = 20.0;
  final _scrollController = ScrollController();
  final _movieRepository = services.get<IMovieRepository>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = (13 / 100) * screenHeight;
    final movieListViewHeight = (18 / 100) * screenHeight;
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(
            delegate: SliverHomeAppBar(
              minExtent: appBarHeight,
              maxExtent: appBarHeight,
              topPadding: 10,
            ),
          ),
        ];
      },
      body: ListView(
        padding: const EdgeInsets.only(top: 5),
        physics: const BouncingScrollPhysics(),
        children: [
          HighlightCarousel(
            movies: _movieRepository.getWithHighlights(),
          ),
          Padding(
            padding: EdgeInsets.all(_horizontalSpacing),
            child: const CategoryButtons(),
          ),
          MovieListView(
            label: 'Marvel',
            movieHeight: movieListViewHeight,
            movies: _movieRepository.getByCategory(CategoryType.marvel),
          ),
          SizedBox(height: _verticalSpacing),
          MovieListView(
            label: 'Disney',
            movieHeight: movieListViewHeight,
            movies: _movieRepository.getByCategory(CategoryType.disney),
          ),
          SizedBox(height: _verticalSpacing),
          MovieContinueListView(
            movies: _movieRepository.getContinueWatching(),
          ),
          SizedBox(height: _verticalSpacing),
        ],
      ),
    );
  }
}
