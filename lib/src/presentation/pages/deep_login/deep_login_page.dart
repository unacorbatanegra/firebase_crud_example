import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';


import '../pages.dart';
import 'deep_login_controller.dart';

class DeepLoginPage extends GetView<DeepLoginController> {
  const DeepLoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLogged ? Menu() : LoginPage(),
    );
  }
}
