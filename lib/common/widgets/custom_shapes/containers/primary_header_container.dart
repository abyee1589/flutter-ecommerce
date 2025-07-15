import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:flutter_app/utils/constants/colors.dart';

class AbPrimaryHeaderContainer extends StatelessWidget {
  const AbPrimaryHeaderContainer({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AbCurvedEdgeWidget(
      child: Container(
        color: AbColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(top: -150, right: -250, child: AbCircularContainer(backgroundColor: AbColors.textWhite.withOpacity(0.1))),
            Positioned(top: 100, right: -300, child: AbCircularContainer(backgroundColor: AbColors.textWhite.withOpacity(0.1))),    
            child,               
          ],                
        ),
      ),
    );
  }
}
