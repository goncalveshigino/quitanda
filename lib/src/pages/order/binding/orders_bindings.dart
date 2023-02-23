import 'package:get/get.dart';
import 'package:quitanda/src/pages/order/controller/all_orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllOrdersController());
  }
}
