import 'package:disney_plus_replica/src/shared/constants/asset_constants.dart';
import 'package:flutter/widgets.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({super.key, this.height = 60});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
          child: const Row(
            children: [
              Expanded(child: _CategoryButton(imagePath: kDisneyCategoryLogo)),
              SizedBox(width: 10),
              Expanded(child: _CategoryButton(imagePath: kPixarCategoryLogo)),
              SizedBox(width: 10),
              Expanded(child: _CategoryButton(imagePath: kMarvelCategoryLogo)),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: height,
          child: const Row(
            children: [
              Expanded(child: _CategoryButton(imagePath: kStarWarsCategoryLogo)),
              SizedBox(width: 10),
              Expanded(child: _CategoryButton(imagePath: kNationalGeographicCategoryLogo)),
              SizedBox(width: 10),
              Expanded(child: _CategoryButton(imagePath: kStarCategoryLogo)),
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF1F202C), Color(0xFF2D2F3B)],
          ),
          border: Border.all(
            width: 2,
            color: const Color(0xFF383943),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
