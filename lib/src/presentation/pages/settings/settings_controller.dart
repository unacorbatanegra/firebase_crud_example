import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../domain/domains.dart';

class SettingsController extends GetxController {
  final AuthDomain authDomain;

  SettingsController({
    @required this.authDomain,
  });

  void logOut() => authDomain.signOut();
}
