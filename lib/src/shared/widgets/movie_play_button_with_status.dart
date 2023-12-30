import 'package:disney_plus_replica/src/shared/widgets/movie_play_button.dart';
import 'package:disney_plus_replica/src/shared/widgets/movie_watch_status_bar.dart';
import 'package:flutter/material.dart';

class MoviePlayButtonWithStatus extends StatelessWidget {
  const MoviePlayButtonWithStatus({
    super.key,
    required this.duration,
    required this.watched,
  });

  final int duration;
  final int watched;

  @override
  Widget build(BuildContext context) {
    final remainder = duration - watched;
    final hasPlayed = remainder != duration;

    return Column(
      children: [
        if (hasPlayed) ...[
          Row(
            children: [
              Expanded(
                child: MovieWatchStatusBar(
                  duration: duration,
                  watched: watched,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${remainder}m remaining',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 7),
        ],
        MoviePlayButton(hasPlayed: hasPlayed),
      ],
    );
  }
}
