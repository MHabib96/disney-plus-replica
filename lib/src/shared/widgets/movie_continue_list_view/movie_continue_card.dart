part of 'movie_continue_list_view.dart';

class _MovieContinueCard extends StatelessWidget {
  const _MovieContinueCard({
    super.key,
    required this.movie,
    required this.width,
  });

  final Movie movie;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              fit: BoxFit.fill,
              movie.continueImagePath!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: FloatingActionButton(
                    mini: true,
                    shape: const CircleBorder(),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onPressed: () {},
                    child: const Icon(
                      size: 20,
                      color: Colors.white,
                      Icons.play_arrow_rounded,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: width,
                  child: MovieWatchStatusBar(
                    watched: movie.watched,
                    duration: movie.duration,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
