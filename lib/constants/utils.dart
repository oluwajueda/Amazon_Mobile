import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:io";

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text)),
  );
}

pickImages() async {
  List<File> images = [];

  try {} catch (e) {
    debugPrint(e.toString());
  }
}
