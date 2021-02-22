import 'package:flutter/material.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';

class ButtonPrincipalWidget extends StatelessWidget {
  const ButtonPrincipalWidget({Key key, this.title, this.onPressed})
      : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
        ));
  }
}
