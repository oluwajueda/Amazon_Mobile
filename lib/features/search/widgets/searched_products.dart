import 'package:amazon_mobile/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            Image.network(
              product.images[0],
              fit: BoxFit.fitHeight,
              height: 135,
              width: 135,
            )
          ]),
        )
      ],
    );
  }
}
