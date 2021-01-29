import 'package:get/get.dart';

import 'deep_login_controller.dart';

class DeepLoginBinding extends Bindings {
  @override
  void dependencies() => Get.put<DeepLoginController>(DeepLoginController());
}
