import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/pages/cart/result/cart_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();

  Future<CartResult<List>> getCartItems({
    required String token,
    required String userId,
  }) async {
   final result = await _httpManager.restRequest(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      hearders: {'X-Parse-Session-Token': token},
      body: {
        'user': userId,
      },
    );

    if(result['result'] != null){

      print(result['result']);

    }else{

      print('Erro ao recuperar items no carrinho');

    }
  }
}
