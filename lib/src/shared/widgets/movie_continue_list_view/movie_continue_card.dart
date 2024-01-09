part of 'movie_continue_list_view.dart';

class _MovieContinueCard extends StatelessWidget {
  const _MovieContinueCard({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Stack(
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
              Positioned.fill(
                bottom: 5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _PlayButtonWithStatusBar(
                    watched: movie.watched,
                    duration: movie.duration,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButtonWithStatusBar extends StatelessWidget {
  const _PlayButtonWithStatusBar({
    required this.watched,
    required this.duration,
  });

  final int watched;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        MovieWatchStatusBar(
          watched: watched,
          duration: duration,
        ),
      ],
    );
  }
}
