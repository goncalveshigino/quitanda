import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoadin = false.obs;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoadin.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoadin.value = false;
  }
}
