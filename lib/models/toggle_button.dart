import 'package:flutter/material.dart';

const List<Text> member = [
  Text(
    'Student',
    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
  ),
  Text('Parent',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
];

class ToggleButton extends StatelessWidget {
  ToggleButton({
    Key? key,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  final List<bool> selected;
  final ValueChanged onPressed;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      disabledColor: Colors.white,
      color: Colors.deepPurple,
      onPressed: onPressed,
      direction: Axis.horizontal,
      isSelected: selected,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      selectedBorderColor: Colors.red.shade500,
      selectedColor: Colors.white,
      fillColor: Colors.redAccent,
      borderColor: Colors.deepPurple,
      textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.teal,
          letterSpacing: 0.5),
      constraints: const BoxConstraints(
          maxWidth: double.infinity,
          minWidth: 158,
          maxHeight: 50,
          minHeight: 35),
      children: member,
    );
  }
}
