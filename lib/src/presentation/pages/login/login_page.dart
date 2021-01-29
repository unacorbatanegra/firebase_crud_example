import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(authDomain: AuthDomain()),
      builder: (_) => _LoginPage(),
    );
  }
}

class _LoginPage extends GetView<LoginController> {
  const _LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('google'),
          onPressed: controller.login,
        ),
      ),
    );
  }
}
