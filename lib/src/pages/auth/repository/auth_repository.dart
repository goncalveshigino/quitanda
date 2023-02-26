import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/pages/auth/repository/auth_error.dart'
    as auth_error;
import 'package:quitanda/src/pages/auth/result/auth_result.dart';
import '../../../models/user_model.dart';
import '../../../services/http_manager.dart';



class AuthRepository  {
  
  final HttpManager _httpManager = HttpManager();

  AuthResult handleuUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(
        auth_error.authErrorsString(result['error']),
      );
    }
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {'email': email, 'password': password},
    );

    return handleuUserOrError(result);
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        hearders: {'X-Parse-Session-Token': token});

    return handleuUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );

    return handleuUserOrError(result);
  }

  Future<void> resetPassword(String email) async {
    await _httpManager.restRequest(
      url: Endpoints.resetPassword,
      method: HttpMethods.post,
      body: {'email': email},
    );
  }

  Future<bool> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
    required String token,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.changePassword,
      method: HttpMethods.post,
      body: {
        'email': email,
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
      hearders: {'X-Parse-Session-Token': token},
    );

    return result['result'] == null;
  }
}
