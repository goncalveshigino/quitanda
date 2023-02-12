import 'package:get/get.dart';
import 'package:quitanda/src/constants/storage_keys.dart';
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

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (error) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    user = UserModel();

    await utilsServices.removeLocalData(
      key: StorageKeys.token,
    );

    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  void saveTokenAndProceedToBase() {
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    Get.offAllNamed(PagesRoutes.baseRoute);
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
        saveTokenAndProceedToBase();
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
