import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbChoiChip extends StatelessWidget {
  const AbChoiChip({
    super.key, 
    required this.text, 
    required this.selected, 
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final colorSelected = AbHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: colorSelected ? const SizedBox() : Text(text), 
        selected: selected, 
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? AbColors.white : null),
        avatar: colorSelected ? AbCircularContainer(width: 50, height: 50, backgroundColor: AbHelperFunctions.getColor(text)!) : null,
        shape: colorSelected ? const CircleBorder() : null,
        labelPadding: colorSelected ? const EdgeInsets.all(0) : null,
        padding: colorSelected ? const EdgeInsets.all(0) : null,
        // selectedColor: Colors.green,
        backgroundColor: colorSelected ? AbHelperFunctions.getColor(text)! : null,
        
      ),
    );
  }
}