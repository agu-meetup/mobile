import 'package:flutter/material.dart';

import '../../../core/assets.dart';

class DetailPriceWidget extends StatelessWidget {
  String price;

  DetailPriceWidget({required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(
            turkishLiraGray,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          price,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
