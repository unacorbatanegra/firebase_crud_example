import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DialogHelper {
  static Future<bool> ifDialog(
    String mensaje,
  ) async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: Text(
          'INFORMATION',
          style: Get.textTheme.subtitle1.copyWith(
              fontSize: 20,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'CANCEL',
              style: Get.textTheme.button.copyWith(
                color: Get.theme.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Get.back(result: false),
          ),
          FlatButton(
            child: Text(
              'ACCEPT',
              style: Get.textTheme.button.copyWith(
                color: Get.theme.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Get.back(result: true),
          )
        ],
      ),
      useRootNavigator: true,
    );
    return result ?? false;
  }

  static Future<void> infoDialog(String message) => Get.dialog(
        AlertDialog(
          title: Text(
            'INFORMATION',
            style: Get.textTheme.subtitle1.copyWith(
              fontSize: 20,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'ACCEPT',
                style: Get.textTheme.button.copyWith(
                  color: Get.theme.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: Get.back,
            )
          ],
        ),
      );
}
