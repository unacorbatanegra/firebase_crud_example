import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../utils/utils.dart';

class CustomersController extends GetxController {
  final CustomerDomain customerDomain;

  ScrollController scrollController;
  TextEditingController controller;
  CustomersController({
    @required this.customerDomain,
  });
  final list = <Customer>[].obs;
  var _isCharging = false;
  final _isLoading = false.obs;
  final _isSearching = false.obs;
  final focusNode = FocusNode();
  final debouncer = Debouncer(milliseconds: 500);
  @override
  void onInit() {
    scrollController ??= ScrollController();
    controller ??= TextEditingController();
    scrollController?.addListener(onScroll);
    init();
    super.onInit();
  }

  void onTextSearchChanged(String value) async {
    debouncer.run(
      () => filter(value),
    );
  }

  void filter(String value) {
    print(value);
  }

  void onScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= Get.height * .20 && !_isCharging) {
      _isCharging = true;
      list.addAll(
          await customerDomain.getList(startAfterTheLastDocument: true));
      _isCharging = false;
    }
  }

  void focusListener() {
    _isSearching.value = focusNode.hasFocus;
    if (!focusNode.hasFocus) {
      controller.text = '';
    }
  }

  void init() async {
    focusNode.addListener(focusListener);
    _isLoading(true);
    list.addAll(await customerDomain.getList());
    _isLoading(false);
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
      arguments: list[index],
    ) as bool;
    print(result);
    if (result ?? false) init();
  }

  bool changeSearching() {
    _isSearching.value = !isSearching;
    focusNode.requestFocus();
    return _isSearching.value;
  }

  bool get isLoading => _isLoading.value;
  bool get isSearching => _isSearching.value;

  @override
  void onClose() {
    scrollController?.removeListener(onScroll);
    focusNode?.removeListener(focusListener);
    scrollController?.dispose();
    controller?.dispose();
    focusNode?.dispose();
    super.onClose();
  }
}
