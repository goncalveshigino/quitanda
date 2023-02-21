import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/pages/cart/result/cart_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class CartRepository {
  
  final _httpManager = HttpManager();

  Future<CartResult<List<CartItemModel>>> getCartItems({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      hearders: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'user': userId,
      },
    );

    if (result['result'] != null) {
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();

      return CartResult<List<CartItemModel>>.success(data);
    } else {
      return CartResult.error(
          'Ocorreu um erro ao recuperar os itens do carrinho');
    }
  }


  Future<bool> changeItemQuantity({
    required String token, 
    required String cartItemId, 
    required int quantity
    }) async {
   final result = await _httpManager.restRequest(
      url: Endpoints.modifyItemQuantity,
      method: HttpMethods.post,
      body: {
        'cartItemId': cartItemId,
        'quantity': quantity
      },
      hearders: {
        'X-Parse-Session-Token': token
      }
    );

    return result.isEmpty;
  }


  

  Future<CartResult<String>> addItemToCart({
    required String userId,
    required String token,
    required String productId,
    required int quantity,
  }) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.addItemToCart,
        method: HttpMethods.post,
        body: {
          'user': userId,
          'quantity': quantity,
          'productId': productId,
        },
        hearders: {
          'X-Parse-Session-Token': token,
        });

    if (result['result'] != null) {
      return CartResult<String>.success(result['result']['id']);
    } else {
      return CartResult.error('Nao foi possivel adicionar produto no carringo');
    }
  }
}
