import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'customer_controller.dart';

class CustomerPage extends GetView<CustomerController> {
  const CustomerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gap18 = SizedBox(height: 18.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
        actions: [
          Obx(
            () => controller.isEditing
                ? IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: controller.delete,
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
      bottomNavigationBar: CustomButton(
        onPressed: controller.accept,
        label: 'Save changes',
      ),
      body: Obx(
        () => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      gap18,
                      CustomTextField(
                        controller: controller.nameController,
                        label: 'Name',
                        hint: 'Nicolas...',
                        validator: controller.validator,
                      ),
                      gap18,
                      CustomTextField(
                        controller: controller.lastNameController,
                        label: 'Last name',
                        hint: 'Lopez...',
                        validator: controller.validator,
                      ),
                      gap18,
                      CustomTextField(
                        controller: controller.emailController,
                        label: 'Email',
                        hint: 'unacorbatanegra@gmail.com...',
                        validator: controller.validator,
                      ),
                      gap18,
                      CustomTextField(
                        controller: controller.usernameController,
                        label: 'username',
                        hint: '@unacorbatanegra',
                        validator: controller.validator,
                      ),
                      gap18,
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: controller.changeCreditAvailable,
                        title: const Text('Credit available'),
                        subtitle: const Text(
                            'Indicate if the customer can buy on credit'),
                        trailing: Switch(
                          value: controller.creditAvailable,
                          onChanged: (_) => controller.changeCreditAvailable(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
