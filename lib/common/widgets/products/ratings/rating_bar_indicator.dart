import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class AbRatingBarIndicator extends StatelessWidget {
  const AbRatingBarIndicator({
    super.key, 
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      unratedColor:   AbColors.grey,
      itemSize: 20,
      itemBuilder: (_, _) => const Icon(Iconsax.star1, color: AbColors.primary),);
  }
}
