import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFF8D8E98)
);

class IconContent extends StatelessWidget {
  IconContent(this.icon,this.label);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 75,
        ),
        SizedBox(
          height: 13,
        ),
        Text(
          label,style: labelTextStyle
        ),
      ],
    );
  }
}