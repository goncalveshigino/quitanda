import 'package:flutter/material.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/services/utils_services.dart';

import '../../../models/order_model.dart';

class OrderTile extends StatelessWidget {
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderModel order;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido : ${order.id},',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsServices: utilsServices,
                            orderItem: orderItem,);
                        }).toList(),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.green,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {

  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(fontWeight: FontWeight.bold
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName),),
          Text(
            utilsServices.priceToCurrency(orderItem.totalPrice())
          )
        ],
      ),
    );
  }
}
