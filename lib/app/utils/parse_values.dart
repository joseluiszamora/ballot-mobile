import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

// Clean String
String cleanString(String val) => val.trim().toLowerCase();

int stringToInt(String val) => int.parse(val.trim());

double stringToDouble(String val) => double.parse(val.trim());

// Format datetime to INT
int formatDate(DateTime dateTime) {
  String formatdate = DateFormat('yyyyMMdd').format(dateTime);
  return int.parse(formatdate);
}

// Return nationalityId
int nationCode(String nationality, String country) {
  if (nationality == 'Boliviano') {
    return 2;
  } else {
    return 0;
  }
}

// return Doctype, si es boliviano o extranjero
String doctype(String nationality) {
  if (nationality == 'Boliviano') {
    return 'CI';
  } else {
    return 'DOC_EXTRANJERO';
  }
}

// Get Gender value from name
String genderValue(String gender) {
  if (gender == 'Hombre') {
    return 'm';
  }
  return 'f';
}

String fileToBase64(File file) {
  final bytes = file.readAsBytesSync();
  const Base64Codec base64Codec = Base64Codec();
  return base64Codec.encode(bytes);
}

// Clean string & set default
String cleanStringToForm(String val) =>
    (val != null && val.trim().toLowerCase() != "")
        ? val.trim().toLowerCase()
        : "";

// Clean string & set default
String cleanMailToForm(String val) =>
    (val != null && val.trim() != "" && val.trim().toLowerCase() != "s/c")
        ? val.trim().toLowerCase()
        : "";
