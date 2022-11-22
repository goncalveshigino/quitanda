import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

import '../../../../models/item_model.dart';
import '../../../../services/utils_services.dart';

class HomeItemTile extends StatelessWidget {

 
  final ItemModel item;

 final  UtilsServices utilsServices = UtilsServices();

  HomeItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          shadowColor: Color.fromARGB(255, 75, 27, 27),
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
                     utilsServices.priceToCurrency( item.price),
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
          
        ),

        Positioned(
          top: 4,
          right: 4,


          child: Container(

            height: 40,
            width: 35,

            child: ,
          )
        )
      ],
    );
  }
}