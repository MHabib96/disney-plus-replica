import 'package:disney_plus_replica/src/shared/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class MoviePlayButton extends StatelessWidget {
  const MoviePlayButton({super.key, required this.hasPlayed});

  final bool hasPlayed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.play_arrow_rounded,
            color: Colors.black,
          ),
          Text(
            hasPlayed ? 'CONTINUE' : 'PLAY',
            style: kPlayButtonStyle,
          ),
        ],
      ),
    );
  }
}
