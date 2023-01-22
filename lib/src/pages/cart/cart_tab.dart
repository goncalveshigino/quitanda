import 'package:flutter/material.dart';


class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),

      body: Column(
        children: [

   Expanded(
    child: Placeholder(),
   )

        ],
      ),
    );
  }
} 