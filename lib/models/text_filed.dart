import 'package:flutter/material.dart';

class TextFiled extends StatelessWidget {
  const TextFiled({
    this.topContentPadding = 10,
    this.isExpand = false,
    required this.height,
    this.isCollapsed = false,
    required this.maxLines,
    required this.onChanged,
    required this.labelText,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    Key? key,
    this.minLines,
    this.hintText = '',
    required this.errorText,
    required this.onTap,
    this.color = Colors.deepPurple,
  }) : super(key: key);

  final String hintText;
  final ValueChanged onChanged;
  final bool isCollapsed;
  final maxLines;
  final minLines;
  final String labelText;
  final double height;
  final bool isExpand;
  final double topContentPadding;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String errorText;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: height,
      child: TextField(
        onTap: onTap,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.deepPurple,
        ),
        onChanged: onChanged,
        cursorColor: Colors.deepPurple,
        decoration: InputDecoration(
          //errorText: errorText,
          floatingLabelBehavior: floatingLabelBehavior,
          isCollapsed: isCollapsed,
          contentPadding: EdgeInsets.only(
              left: 15, bottom: 20, top: topContentPadding, right: 10),
          iconColor: Colors.purple,
          labelStyle:  TextStyle(color: color),
          focusColor: Colors.teal,
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gapPadding: 4.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.deepPurple),
          ),
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.deepPurpleAccent),
        ),
        expands: isExpand,
        maxLines: maxLines,
      ),
    );
  }
}
