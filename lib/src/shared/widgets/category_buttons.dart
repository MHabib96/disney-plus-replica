import 'package:disney_plus_replica/src/shared/constants/asset_constants.dart';
import 'package:flutter/widgets.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: _CategoryButton(imagePath: kDisneyCategoryLogo)),
            SizedBox(width: 10),
            Expanded(child: _CategoryButton(imagePath: kPixarCategoryLogo)),
            SizedBox(width: 10),
            Expanded(child: _CategoryButton(imagePath: kMarvelCategoryLogo)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _CategoryButton(imagePath: kStarWarsCategoryLogo)),
            SizedBox(width: 10),
            Expanded(child: _CategoryButton(imagePath: kNationalGeographicCategoryLogo)),
            SizedBox(width: 10),
            Expanded(child: _CategoryButton(imagePath: kStarCategoryLogo)),
          ],
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
      onTap: () => print('Go to category screen.'),
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
