import 'dart:io';
import 'package:flutter/material.dart';

getImageUrl() => "http://192.168.10.252/uploads/";

Widget imageFromUrl(String url, double radius) {
  if (url != null) {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
      radius: radius,
      backgroundColor: Colors.transparent,
    );
  } else {
    return Container(color: Colors.grey);
  }
}

Widget imageProfileFromUrl(String url, double radius) {
  if (url != null && url != "") {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
      radius: radius,
      backgroundColor: Colors.transparent,
    );
  } else {
    return CircleAvatar(
      backgroundImage: AssetImage("assets/person.jpg"),
      radius: radius,
      backgroundColor: Colors.transparent,
    );
  }
}

Widget imageFromUrlBackend(String url, double radius, String type) {
  if (url != null && url != "") {
    try {
      String urlImage = "${getImageUrl()}$url";
      if (type == "image") {
        return circlePerson(urlImage, radius);
      } else {
        return circleDocument(urlImage, radius);
      }
    } catch (e) {
      return defaultImage(radius, type);
    }
  } else {
    return defaultImage(radius, type);
  }
}

Widget imageFromFile(File file, double radius, String type) {
  if (file != null) {
    if (type == "image") {
      return circlePersonFile(file, radius);
    } else {
      return circleDocumentFile(file, radius);
    }
  } else {
    return defaultImage(radius, type);
  }
}

Widget circlePerson(String urlImage, double radius) => CircleAvatar(
    backgroundImage: NetworkImage(urlImage),
    radius: radius,
    backgroundColor: Colors.transparent);

Widget circleDocument(String urlImage, double radius) => Card(
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    child: Container(child: Image.network(urlImage)));

Widget circlePersonFile(File file, double radius) => CircleAvatar(
    backgroundImage: FileImage(file),
    radius: radius,
    backgroundColor: Colors.transparent);

Widget circleDocumentFile(File file, double radius) => Card(
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    child: Container(child: Image.file(file)));

Widget defaultImage(double radius, String type) {
  if (type == "image") {
    return CircleAvatar(
        backgroundImage: AssetImage("assets/ballot/nologo.png"),
        radius: radius,
        backgroundColor: Colors.transparent);
  } else {
    return Card(child: Container(child: Image.asset("assets/card-icon.png")));
  }
}

Widget imageDocumentoFromUrlBackend(String url, double radius) {
  if (url != null && url != "") {
    try {
      String urlImage = "${getImageUrl()}$url";
      return Card(
          child: Container(
              width: 150, height: 80, child: Image.network(urlImage)));
    } catch (e) {
      return Card(
          child: Container(
              width: 150,
              height: 80,
              child: Image.asset("assets/card-icon.png")));
    }
  } else {
    return Card(
        child: Container(
            width: 150,
            height: 80,
            child: Image.asset("assets/card-icon.png")));
  }
}
