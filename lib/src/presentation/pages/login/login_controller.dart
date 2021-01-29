import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';

class LoginController extends GetxController {
  final AuthDomain authDomain;

  LoginController({
    @required this.authDomain,
  });

  void login() => authDomain.login();
}
