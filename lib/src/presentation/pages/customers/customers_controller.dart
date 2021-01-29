import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';

class CustomersController extends GetxController
    with StateMixin<List<Customer>> {
  final AuthDomain authDomain;
  final CustomerDomain customerDomain;

  ScrollController scrollController;
  CustomersController({
    @required this.authDomain,
    @required this.customerDomain,
  });
  var _list = <Customer>[];
  var _isCharging = false;
  @override
  void onInit() {
    scrollController ??= ScrollController();
    scrollController?.addListener(onScroll);
    init();
    super.onInit();
  }

  void onScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= Get.height * .20 && !_isCharging) {
      _isCharging = true;
      _list.addAll(
          await customerDomain.getList(startAfterTheLastDocument: true));
      change(_list, status: RxStatus.success());
      _isCharging = false;
    }
  }

  void init() async {
    change(null, status: RxStatus.loading());
    try {
      _list = await customerDomain.getList();
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    if (_list.isNotEmpty) {
      change(_list, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }

  void onAdd() async {
    final result = await Get.toNamed(
      RouteName.customer,
    ) as bool;
    if (result ?? false) init();
  }

  void onTap(int index) async {
    final result = await Get.toNamed(
      RouteName.customer,
      arguments: _list[index],
    ) as bool;
    if (result ?? false) init();
  }

  void logOut() => authDomain.signOut();

  @override
  void onClose() {
    scrollController?.removeListener(onScroll);
    scrollController?.dispose();
    super.onClose();
  }
}
