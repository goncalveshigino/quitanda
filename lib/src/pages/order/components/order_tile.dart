
import 'package:flutter/material.dart';

import '../../../models/order_model.dart';


class OrderTile extends StatelessWidget {

  const OrderTile({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(title: const Text('Pedido )1')),
    );
  }
}