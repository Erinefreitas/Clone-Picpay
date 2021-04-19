import 'package:flutter/material.dart';

class ButtonTab extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Color color;

  const ButtonTab({this.isSelected, this.text, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: isSelected
          ? BoxDecoration(
              border: Border(bottom: BorderSide(color: color, width: 2)))
          : null,
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.green : Colors.black),
        ),
        style: TextButton.styleFrom(primary: color),
      ),
    );
  }
}
