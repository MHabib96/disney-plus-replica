import 'package:disney_plus_replica/src/shared/widgets/custom_animated_icon.dart';
import 'package:flutter/material.dart';

class MovieUtilityButtons extends StatelessWidget {
  const MovieUtilityButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 30,
      children: [
        CustomAnimatedIcon(
          label: 'Watchlist',
          startIcon: Icons.add,
          endIcon: Icons.check,
          beginRotation: 0.5,
          padding: EdgeInsets.all(5),
          duration: Duration(milliseconds: 500),
        ),
        _UtilityButton(
          label: 'Trailer',
          icon: Icons.movie_creation_outlined,
        ),
        _UtilityButton(
          label: 'Download',
          icon: Icons.download,
        ),
      ],
    );
  }
}

class _UtilityButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _UtilityButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(icon, size: 26, color: Colors.white),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
