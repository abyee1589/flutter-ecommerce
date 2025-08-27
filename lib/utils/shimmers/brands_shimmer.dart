import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/utils/shimmers/shimmer_loader.dart';

class AbBrandShimmer extends StatelessWidget {
  const AbBrandShimmer({super.key, this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AbGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, _) => const AbShimmerEffect(width: 300, height: 80),
    );
  }
}
