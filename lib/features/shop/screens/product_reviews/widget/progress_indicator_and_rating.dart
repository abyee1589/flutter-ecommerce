import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/device/device_utility.dart';

class AbRatingProgressIndicator extends StatelessWidget {
  const AbRatingProgressIndicator({
    super.key, 
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: AbDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: AbColors.grey,
              valueColor: const AlwaysStoppedAnimation(AbColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],);
  }
}