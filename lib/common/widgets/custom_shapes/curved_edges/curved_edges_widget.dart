import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/curved_edges/custom_curved_edge.dart';


class AbCurvedEdgeWidget extends StatelessWidget {
  const AbCurvedEdgeWidget({
    super.key, this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AbCurvedEdges(),
      child: child,
    );
  }
}

