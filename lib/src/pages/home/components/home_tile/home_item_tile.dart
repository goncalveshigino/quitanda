import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

import '../../../../models/item_model.dart';

class HomeItemTile extends StatelessWidget {
  const HomeItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                item.imgUrl,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Text(
              item.itemName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  item.price.toStringAsFixed(2),
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: CustomColors.customSwatchColor
                  ),
                ),

                Text('/${item.unit}', style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
