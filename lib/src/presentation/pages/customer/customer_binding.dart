import 'package:get/instance_manager.dart';
import '../../../domain/domains.dart';
import 'customer_controller.dart';

class CustomerBinding extends Bindings {
  @override
  void dependencies() => Get.put<CustomerController>(
        CustomerController(customerDomain: CustomerDomain()),
      );
}
