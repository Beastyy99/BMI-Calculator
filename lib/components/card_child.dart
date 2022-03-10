import 'package:flutter/material.dart';
import '../constants.dart';

class CardChild extends StatelessWidget {
  final String gender;
  final IconData icon;

  const CardChild({this.gender, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kGenderTextStyle,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
