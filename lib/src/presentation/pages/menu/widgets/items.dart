import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../pages.dart';

mixin Items {
  static final pages = [
    CustomersPage(),
    SettingsPage(),
  ];

  static const buttons = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(FlutterIcons.setting_ant),
      activeIcon: Icon(FlutterIcons.setting_ant),
      label: '',
    ),
  ];
}
