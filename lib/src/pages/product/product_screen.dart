import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/services/utils_services.dart';

import '../../models/item_model.dart';

class ProsuctScreen extends StatelessWidget {
  final ItemModel item;
  final UtilsServices utilsServices = UtilsServices();

  ProsuctScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Column(
        children: [
          Expanded(child: Image.asset(item.imgUrl)),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(0, 2),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(item.itemName, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 70,
                      color: Colors.red,
                    )
                  ],
                ),
                Text(
                  utilsServices.priceToCurrency(item.price),
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: CustomColors.customSwatchColor),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      child: Text(
                        item.description ,
                        style: const TextStyle(height: 1.5),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){}, child: Text('Botao'),),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
