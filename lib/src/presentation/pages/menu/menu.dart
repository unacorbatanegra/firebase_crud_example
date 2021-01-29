import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import 'menu_controller.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(
      init: MenuController(userDomain: UserDomain()),
      builder: (_) => _Menu(),
    );
  }
}

class _Menu extends GetView<MenuController> {
  const _Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading
          ? Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.linear,
                switchOutCurve: Curves.linear,
                child: controller.currentChild,
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.currentIndex,
                onTap: controller.changePage,
                showSelectedLabels: false,
                elevation: 4,
                showUnselectedLabels: false,
                unselectedIconTheme: IconThemeData(
                  size: 30,
                  color: Color(0xFF333333).withOpacity(.7),
                ),
                selectedIconTheme: const IconThemeData(
                  size: 30,
                  color: Color(0xFF2A1A5E),
                ),
                backgroundColor: Colors.white,
                items: controller.buttoms,
              ),
            ),
    );
  }
}
