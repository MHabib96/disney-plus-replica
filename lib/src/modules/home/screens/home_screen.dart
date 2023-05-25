import 'package:disney_plus_replica/bindings.dart';
import 'package:disney_plus_replica/src/modules/home/slivers/sliver_home_app_bar.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_movie_repository.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  final _movieRepository = services.get<IMovieRepository>();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(
            delegate: SliverHomeAppBar(
              minExtent: 90,
              maxExtent: 120,
              topPadding: 10,
            ),
          ),
        ];
      },
      body: ListView(),
    );
  }
}
