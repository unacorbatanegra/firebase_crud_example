import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import 'customers_controller.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CustomersController(
        authDomain: AuthDomain(),
        customerDomain: CustomerDomain(),
      ),
      builder: (_) => _CustomerPage(),
    );
  }
}

class _CustomerPage extends GetView<CustomersController> {
  const _CustomerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.onAdd,
        label: const Text('Add customer'),
        icon: const Icon(Icons.person),
      ),
      body: controller.obx(
        (state) => ListView.separated(
          separatorBuilder: (context, _) => const SizedBox(height: 8.0),
          controller: controller.scrollController,
          itemCount: state.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(state[index].name),
            onTap: () => controller.onTap(index),
          ),
        ),
        onEmpty: const Center(
          child: Text('No data found :('),
        ),
      ),
    );
  }
}
