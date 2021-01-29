import 'package:flutter/foundation.dart' show required;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import '../../../models/models.dart';

class CustomerController extends GetxController {
  final CustomerDomain customerDomain;

  TextEditingController nameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController dniController;
  TextEditingController creditLimitController;
  final _customer = Rx<Customer>();
  CustomerController({
    @required this.customerDomain,
  });

  @override
  void onInit() {
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    dniController = TextEditingController();
    creditLimitController = TextEditingController();
    init();
    super.onInit();
  }

  void delete() async {
    customerDomain.delete(customer.uuid);
  }
  void accept(){}
  void init() async {}
  bool get isEditing => customer != null;
  Customer get customer => _customer.value;

  @override
  void onClose() {
    nameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
    dniController?.dispose();
    creditLimitController?.dispose();
    super.onClose();
  }
}
