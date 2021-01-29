import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import 'customers_controller.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/customer_widget.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CustomersController(
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
    return WillPopScope(
      onWillPop: () async => controller.changeSearching(),
      child: Obx(
        () => Scaffold(
          appBar: CustomAppBar(
            focusNode: controller.focusNode,
            controller: controller.controller,
            onChanged: controller.onTextSearchChanged,
            changeSearching: controller.changeSearching,
            isSearching: controller.isSearching,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: controller.onAdd,
            label: const Text('Add customer'),
            icon: const Icon(Icons.person_add),
          ),
          backgroundColor: Colors.grey[200],
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : controller.list.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: CupertinoScrollbar(
                        child: ListView.separated(
                          separatorBuilder: (context, _) =>
                              const SizedBox(height: 8.0),
                          controller: controller.scrollController,
                          itemCount: controller.list.length,
                          itemBuilder: (context, index) => CustomerWidget(
                            customer: controller.list[index],
                            onTap: () => controller.onTap(index),
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: Text('No data found :('),
                    ),
        ),
      ),
    );
  }
}
