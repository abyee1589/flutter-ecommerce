import 'package:flutter/material.dart';

class AbCircularLoader extends StatelessWidget {
  const AbCircularLoader({
    super.key,
    this.size = 50.0,
    this.strokeWidth = 4.0,
    this.color,
    this.backgroundColor,
  });

  /// Diameter of the loader
  final double size;

  /// Thickness of the loader stroke
  final double strokeWidth;

  /// Color of the loader. Defaults to `Theme.of(context).primaryColor`
  final Color? color;

  /// Background circle color (optional)
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).primaryColor,
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
