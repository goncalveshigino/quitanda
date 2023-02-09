import 'package:get/get.dart';
import 'package:quitanda/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  
  RxBool isLoadin = false.obs;

  final authRepository = AuthRepository();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoadin.value = true;

    await authRepository.signIn(email: email, password: password);

    isLoadin.value = false;
  }
}
