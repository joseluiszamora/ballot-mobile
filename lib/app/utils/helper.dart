import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  Future checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      print("Connected to Internet");
      return true;
    } else {
      print("Unable to connect. Please Check Internet Connection");
      return false;
    }
  }

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFF347AF0),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showToastBottom(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showToastError(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // round 1 to 01
  String round10(int val) {
    if (val < 10) {
      return '0$val';
    }
    return '$val';
  }

  // Get Gender value from name
  String genderValue(String gender) {
    if (gender == 'Hombre') {
      return 'm';
    }
    return 'f';
  }

  // format date to yyyymmdd format
  int formatDate(int year, int month, int day) {
    String tmp = '$year${round10(month)}${round10(day)}';
    return int.parse(tmp);
  }
}
