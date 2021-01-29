import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DeepLoginController extends GetxController {
  final firebaseAuthUser = Rx<User>();
  final _isLogged = false.obs;

  @override
  void onInit() {
    _isLogged.value = FirebaseAuth.instance.currentUser != null;
    super.onInit();
    firebaseAuthUser.bindStream(FirebaseAuth.instance.authStateChanges());
    firebaseAuthUser.listen((user) async {
      _isLogged.value = user?.uid != null;
    });
  }

  bool get isLogged => _isLogged.value;
}
