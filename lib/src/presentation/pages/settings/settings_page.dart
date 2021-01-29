import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingsController(
        authDomain: AuthDomain(),
      ),
      builder: (_) => _SettingsPage(),
    );
  }
}

class _SettingsPage extends GetView<SettingsController> {
  const _SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('log out'),
                onTap: controller.logOut,
              )
            ],
          ),
        ),
      ),
    );
  }
}
