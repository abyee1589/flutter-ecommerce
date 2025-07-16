import 'package:flutter/material.dart';
import 'package:flutter_app/features/shop/screens/product_reviews/widget/progress_indicator_and_rating.dart';


class AbOverallProductRating extends StatelessWidget {
  const AbOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(children: [
            AbRatingProgressIndicator(text: '5', value: 1.0),
            AbRatingProgressIndicator(text: '4', value: 0.8),
            AbRatingProgressIndicator(text: '3', value: 0.6),
            AbRatingProgressIndicator(text: '2', value: 0.4),
            AbRatingProgressIndicator(text: '1', value: 0.2),
          ],),
        ),
      ],
    );
  }
}