import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu(
      {super.key,
      required this.dropDownList,
      required this.text,
      required this.onChanged,
      required this.dropdownValue,
     });

  final String text;
  final List<String> dropDownList;
  final dropdownValue;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: DropdownButton<String>(

          hint: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.deepPurple),
          ),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(),
          onChanged: onChanged,
          items: dropDownList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
