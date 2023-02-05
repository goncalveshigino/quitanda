import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

import '../../../../models/item_model.dart';
import '../../../../services/utils_services.dart';
import '../../../product/product_screen.dart';

class HomeItemTile extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  const HomeItemTile({
    Key? key,
    required this.item,
    required this.cartAnimationMethod,
  }) : super(key: key);

  @override
  State<HomeItemTile> createState() => _HomeItemTileState();
}

class _HomeItemTileState extends State<HomeItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProsuctTab(
                item: widget.item,
              );
            }));
          },
          child: Card(
            elevation: 5,
            shadowColor: const Color.fromARGB(255, 75, 27, 27),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.asset(
                        widget.item.imgUrl,
                        key: imageGk,
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: CustomColors.customSwatchColor),
                      ),
                      Text(
                        '/${widget.item.unit}',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20)),
              child: Material(
                child: InkWell(
                  onTap: () {
                    switchIcon();

                    widget.cartAnimationMethod(imageGk);
                  },
                  child: Ink(
                    height: 40,
                    width: 35,
                    decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                    ),
                    child: Icon(
                      tileIcon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
