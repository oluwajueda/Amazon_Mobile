import 'package:amazon_mobile/common/widgets/loader.dart';
import 'package:amazon_mobile/features/home/services/home_services.dart';
import 'package:amazon_mobile/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_mobile/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;

  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealofDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: const Text(
                        "Deal of the day",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: const Text(
                        "\$999",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: const Text(
                        'Olamide',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: product!.images
                                .map(
                                  (e) => Image.network(
                                    e,
                                    fit: BoxFit.fitWidth,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                                .toList())),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 15,
                        bottom: 15,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "See all deals",
                        style: TextStyle(color: Colors.cyan[800]),
                      ),
                    )
                  ],
                ),
              );
  }
}
