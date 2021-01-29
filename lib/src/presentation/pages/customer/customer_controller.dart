import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';

class CustomerController extends GetxController {
  final CustomerDomain customerDomain;

  TextEditingController nameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController usernameController;

  final _creditAvailable = false.obs;
  Customer customer;
  final _isEditing = false.obs;
  final _isLoading = false.obs;
  CustomerController({
    @required this.customerDomain,
  });

  @override
  void onInit() {
    nameController ??= TextEditingController();
    lastNameController ??= TextEditingController();
    emailController ??= TextEditingController();
    usernameController ??= TextEditingController();

    init();
    super.onInit();
  }

  void delete() async {
    await customerDomain.delete(customer.uuid);
    Get.back(result: true);
  }

  void accept() async {
    if (nameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        usernameController.text.isEmpty) return;
    Get.dialog(AlertDialogCustom);
    await customerDomain.put(
      Customer(
        uuid: customer?.uuid,
        name: nameController.text,
        lastName: lastNameController.text,
        userName: usernameController.text,
        email: emailController.text,
        creditAvailable: creditAvailable,
      ),
    );
    Get.close(1);
    Get.back(result: true);
  }

  void changeCreditAvailable() => _creditAvailable.toggle();

  String validator(String value) =>
      value.isEmpty ? 'must fill all fields' : null;

  void init() async {
    _isLoading(true);
    customer = Get.arguments as Customer;
    _isEditing.value = customer != null;
    if (customer != null) {
      nameController.text = customer.name;
      lastNameController.text = customer.lastName;
      emailController.text = customer.email;
      usernameController.text = customer.userName;
      _creditAvailable.value = customer.creditAvailable;
    }
    _isLoading(false);
  }

  bool get isEditing => _isEditing.value;
  bool get isLoading => _isLoading.value;
  bool get creditAvailable => _creditAvailable.value;

  @override
  void onClose() {
    nameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
    usernameController?.dispose();
    super.onClose();
  }
}
