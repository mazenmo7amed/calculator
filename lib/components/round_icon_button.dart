import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget{
  RoundIconButton({@required this.icon,@required this.onpress});
  final IconData icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
        elevation: 0.0,
        child: Icon(icon),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: Color(0xff4c4f5e),
        onPressed: onpress);
  }
}