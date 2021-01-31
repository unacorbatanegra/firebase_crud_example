import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
final AlertDialogCustom = AlertDialog(
  title: Text(
    'INFORMATION',
    style: Get.textTheme.subtitle1.copyWith(
      fontSize: 20,
      color: Get.theme.accentColor,
      fontFamily: 'Lato',
    ),
  ),
  content: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const CircularProgressIndicator(),
      const SizedBox(width: 20.0),
      const Text('Proccesing')
    ],
  ),
);
