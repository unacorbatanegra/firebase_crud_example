import 'package:flutter/material.dart';
import 'package:get/get.dart';


extension SnackBarExtension on GetInterface {
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  void showSnackBar(SnackBar snackBar) =>
      scaffoldKey.currentState.showSnackBar(snackBar);

  void hideSnackBar() => scaffoldKey.currentState.hideCurrentSnackBar();
}
