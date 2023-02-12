import 'package:get/get.dart';
import 'package:quitanda/src/models/user_model.dart';
import 'package:quitanda/src/pages/auth/repository/auth_repository.dart';
import 'package:quitanda/src/pages/auth/result/auth_result.dart';
import 'package:quitanda/src/pages_routes/app_pages.dart';
import 'package:quitanda/src/services/utils_services.dart';

class AuthController extends GetxController {

  RxBool isLoadin = false.obs;

  final authRepository = AuthRepository();
  final UtilsServices utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> validateToken()async {
    
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoadin.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoadin.value = false;

    result.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(PagesRoutes.baseRoute);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
