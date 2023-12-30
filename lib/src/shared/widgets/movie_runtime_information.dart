import 'package:disney_plus_replica/src/shared/constants/ui_constants.dart';
import 'package:disney_plus_replica/src/shared/helpers/format_helpers.dart';
import 'package:disney_plus_replica/src/shared/types/genre_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieRuntimeInformation extends StatelessWidget {
  final DateTime releaseDate;
  final int duration;
  final List<GenreType> genres;

  const MovieRuntimeInformation({
    super.key,
    required this.releaseDate,
    required this.duration,
    required this.genres,
  });

  String _buildString() {
    return '${releaseDate.year} • ${formatMovieDuration(duration)} • ${formatGenres(genres)}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Center(
            child: Text(
              _buildString(),
              textAlign: TextAlign.center,
              style: kRuntimeInformationStyle,
            ),
          ),
        )
      ],
    );
  }
}
