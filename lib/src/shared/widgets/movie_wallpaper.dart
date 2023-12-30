import 'package:flutter/material.dart';

const double _logoOffset = -50.0;

class MovieWallpaper extends StatelessWidget {
  final String logoImagePath;
  final String backgroundImagePath;

  const MovieWallpaper({
    super.key,
    required this.logoImagePath,
    required this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _logoOffset.abs()),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _Background(backgroundImagePath: backgroundImagePath),
          Positioned(
            bottom: _logoOffset,
            child: Image.asset(logoImagePath, scale: 7),
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final String backgroundImagePath;

  const _Background({required this.backgroundImagePath});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.black.withOpacity(0.5), Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Image.asset(
          backgroundImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
