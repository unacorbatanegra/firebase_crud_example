import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';

import 'extension.dart';
import 'widgets/items.dart';

class MenuController extends GetxController {
  final conectivity = Connectivity();

  final UserDomain userDomain;

  final _currentIndex = 0.obs;
  final _isLoading = false.obs;

  MenuController({
    @required this.userDomain,
  }) : assert(userDomain != null);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    _isLoading.toggle();
    final user = await userDomain.get(userDomain.currentUserUid);
    print(user?.toJson());
    conectivity.onConnectivityChanged.listen(
      (result) => result == ConnectivityResult.none
          ? Get.showSnackBar(
              const SnackBar(
                content: Text('No connection :('),
                duration: Duration(days: 1),
              ),
            )
          : Get.hideSnackBar(),
    );
    _isLoading.toggle();
  }

  Widget get currentChild => Items.pages[currentIndex];

  List<BottomNavigationBarItem> get buttoms => Items.buttons;

  bool get isLoading => _isLoading.value;

  int get currentIndex => _currentIndex.value;

  void changePage(int value) =>
      value != _currentIndex.value ? _currentIndex.value = value : () {};
}
