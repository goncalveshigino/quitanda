import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/src/services/utils_services.dart';

import '../../models/order_model.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;

  PaymentDialog({Key? key, required this.order}) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10),
                  child:  Text(
                    'Pagamento com Pix',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                QrImage(
                  data: '1232424',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                Text(
                  'Vencimento ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy,
                    size: 15,
                  ),
                  label: const Text(
                    'Copiar codigo Pix',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
