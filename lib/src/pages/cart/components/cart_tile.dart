import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/common_widgets/quantity_widget.dart';

import '../../../config/custom_colors.dart';
import '../../../models/cart_item_model.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;

  const CartTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //Imagem
        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        subtitle: Text(
          cartItem.item.price.toString(),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold
          ),
        ),

        trailing: QauntityWidget(
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
          result: (quantity) {},
        ),
      ),
    );
  }
}
