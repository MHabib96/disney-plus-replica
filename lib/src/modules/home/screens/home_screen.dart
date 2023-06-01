import 'package:disney_plus_replica/bindings.dart';
import 'package:disney_plus_replica/src/modules/home/slivers/sliver_home_app_bar.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_movie_repository.dart';
import 'package:disney_plus_replica/src/shared/types/category_type.dart';
import 'package:disney_plus_replica/src/shared/widgets/category_buttons.dart';
import 'package:disney_plus_replica/src/shared/widgets/highlight_carousel.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  final _scrollController = ScrollController();
  final _movieRepository = services.get<IMovieRepository>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = (14 / 100) * screenHeight;
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
          const Padding(
            padding: EdgeInsets.all(20),
            child: CategoryButtons(),
          ),
          MovieListView(
            label: 'Marvel',
            movieHeight: movieListViewHeight,
            movies: _movieRepository.getByCategory(CategoryType.marvel),
          ),
          MovieListView(
            label: 'Disney',
            movieHeight: movieListViewHeight,
            movies: _movieRepository.getByCategory(CategoryType.disney),
          )
        ],
      ),
    );
  }
}
