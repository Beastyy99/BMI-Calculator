import 'package:flutter/material.dart';

class IconActionButton extends StatelessWidget {
  IconActionButton({@required this.onPress, @required this.icon});
  final Function onPress;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      disabledElevation: 0.0,
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
