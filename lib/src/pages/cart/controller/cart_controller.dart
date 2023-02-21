import 'package:get/get.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/cart/repository/cart_repository.dart';
import 'package:quitanda/src/pages/cart/result/cart_result.dart';
import 'package:quitanda/src/services/utils_services.dart';

class CartController extends GetxController {

  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();

    getCartItems();
  }

  double cartITotalPrice() {
    double total = 0;

    for (final item in cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartItemModel>> result =
        await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );

    result.when(
      success: (data) {
        cartItems = data;
        update();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
  

  Future<bool> changeItemQuantity({
    required CartItemModel item,
    required int quantity,
  }) async {
    final result = await cartRepository.changeItemQuantity(
      token: authController.user.token!,
      cartItemId: item.id,
      quantity: quantity,
    );

    
    if(result){

      if(quantity == 0){

         cartItems.removeWhere((cartItem) => cartItem.id == item.id);

      }else{

        cartItems.firstWhere((cartItem) => cartItem.id == item.id).quantity = quantity;

      }

      update();

    } else{

       utilsServices.showToast(
          message: 'Ocorreu um erro ao acessar a quantidade do produto',
          isError: true,
        );

    }



    return result;
  }


  int getItemIndex(ItemModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.item.id == item.id);
  }


  Future<void> addItemToCart(
      {required ItemModel item, int quantity = 1}) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      final product = cartItems[itemIndex];

      await changeItemQuantity(item: product, quantity: (product.quantity + quantity));

    } else {
      final CartResult<String> result = await cartRepository.addItemToCart(
        userId: authController.user.id!,
        token: authController.user.token!,
        productId: item.id,
        quantity: quantity,
      );

      result.when(
        success: (cartItemId) {
          cartItems.add(
            CartItemModel(
              id: cartItemId,
              item: item,
              quantity: quantity,
            ),
          );
        },
        error: (message) {
          utilsServices.showToast(
            message: message,
            isError: true,
          );
        },
      );
    }

    update();
  }
}
