import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'customer_controller.dart';

class CustomerPage extends GetView<CustomerController> {
  const CustomerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gap18 = SizedBox(height: 18.0);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Customer'),
          actions: [
            Visibility(
              child: IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: controller.delete,
              ),
            )
          ],
        ),
        bottomNavigationBar: CustomButton(
          onPressed: controller.accept,
          label: 'Save changes',
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                gap18,
                CustomTextField(
                  controller: controller.nameController,
                  hint: 'last name',
                  label: 'last name',
                ),
                gap18,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
