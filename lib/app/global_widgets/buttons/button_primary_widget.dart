import 'package:flutter/material.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  const ButtonPrimaryWidget({Key key, this.title, this.onPressed})
      : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        child: new Text(title),
        onPressed: onPressed,
        textColor: Color(0xFF347AF0),
        borderSide: BorderSide(
            color: Color(0xFF347AF0), style: BorderStyle.solid, width: 1.0),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)));
  }
}
