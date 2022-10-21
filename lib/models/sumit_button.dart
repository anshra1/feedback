import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SummitButton extends StatelessWidget {
  SummitButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.redAccent,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text(
            'Summit',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
