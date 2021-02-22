import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void showDialogAlert(
    BuildContext context,
    String title,
    String subtitle,
    String buttonTitle,
    VoidCallback firstButtonPresed,
    VoidCallback cancelButtonPresed) {
  var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: true,
      isOverlayTapDismiss: false,
      titleStyle: TextStyle(fontSize: 20.0),
      descStyle: TextStyle(fontSize: 16.0),
      animationDuration: Duration(milliseconds: 400));
  Alert(
    context: context,
    type: AlertType.warning,
    style: alertStyle,
    title: title,
    closeFunction: cancelButtonPresed,
    desc: subtitle,
    buttons: [
      DialogButton(
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: firstButtonPresed
      )
    ],
  ).show();
}

void showDialogAlert2(
    BuildContext context,
    String title,
    String subtitle,
    String buttonTitle,
    VoidCallback firstButtonPresed,
    VoidCallback secondButtonPresed) {
  var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      titleStyle: TextStyle(fontSize: 20.0),
      descStyle: TextStyle(fontSize: 16.0),
      animationDuration: Duration(milliseconds: 400));
  Alert(
    context: context,
    type: AlertType.warning,
    style: alertStyle,
    title: title,
    desc: subtitle,
    buttons: [
      DialogButton(
          child: Text("Ahora No",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          onPressed: secondButtonPresed,
          color: Styles().colorSecondary),
      DialogButton(
          child: Text(buttonTitle,
              style: TextStyle(color: Colors.white, fontSize: 20)),
          onPressed: firstButtonPresed,
          color: Styles().colorPrimary)
    ],
  ).show();
}

void showDialogPin(
    GlobalKey<FormBuilderState> key,
    BuildContext context,
    String title,
    String subtitle,
    String buttonTitle,
    VoidCallback onCustomButtonPresed) {
  var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      titleStyle: TextStyle(fontSize: 20.0),
      descStyle: TextStyle(fontSize: 16.0),
      animationDuration: Duration(milliseconds: 400));
  Alert(
    context: context,
    style: alertStyle,
    title: title,
    content: FormBuilder(
      key: key,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text("Favor introduce tu codigo PIN",
                style: TextStyle(fontSize: 16, color: Color(0XFF485068))),
          ),
          FormBuilderTextField(
              name: "pin",
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'codigo PIN'),
              validator: FormBuilderValidators.equal(context, '',
                  errorText: 'Campo Obligatorio'))
        ],
      ),
    ),
    buttons: [
      DialogButton(
        child: Text(
          "Cancelar",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: Colors.grey,
        onPressed: () => Navigator.pop(context),
      ),
      DialogButton(
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onCustomButtonPresed
      ),
    ],
  ).show();
}

void showDialogWarning(BuildContext context, String title, String subtitle,
    String buttonTitle, VoidCallback buttonPresed) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: title,
    desc: subtitle,
    buttons: [
      DialogButton(
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: buttonPresed,
        width: 120,
      )
    ],
  ).show();
}

void showDialogError(BuildContext context) {
  Alert(
    context: context,
    type: AlertType.error,
    title: "Ups!",
    desc: "Ocurrio un error, vuelve a intentarlo mas tarde.",
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}

class CustomProgressDialog extends ProgressDialog {
  BuildContext _context;
  String _text;

  CustomProgressDialog(BuildContext context, String text)
      : _context = context,
        _text = text,
        super(context);

  ProgressDialog normal() {
    ProgressDialog progress = ProgressDialog(_context,
        type: ProgressDialogType.Normal, isDismissible: false);
    progress.style(
        message: _text,
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut);
    return progress;
  }
}
