import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:flutter_app/features/shop/screens/product_reviews/widget/rating_progress_indicaator.dart';
import 'package:flutter_app/features/shop/screens/product_reviews/widget/user_review_card.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AbAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Reviews and ratings are verified and they are from the people who use the same product that you use!'),
              const SizedBox(height: AbSizes.spaceBtwItems),

              /// Overall Product Ratings
              const AbOverallProductRating(),
              const AbRatingBarIndicator(rating: 3.5,),
              Text('12, 611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// User review list 
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
          ),
      ),
    );
  }
}



