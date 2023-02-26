import 'package:amazon_mobile/common/widgets/loader.dart';
import 'package:amazon_mobile/features/home/services/home_services.dart';
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

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : Column(
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
                    'https://plus.unsplash.com/premium_photo-1663100596017-043f4e0d2bf1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                    height: 235,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                    child: const Text(
                      "\$999",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
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
                      children: [
                        Image.network(
                          'https://plus.unsplash.com/premium_photo-1663100596017-043f4e0d2bf1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                          fit: BoxFit.fitWidth,
                          width: 100,
                          height: 100,
                        ),
                        Image.network(
                          'https://plus.unsplash.com/premium_photo-1663100596017-043f4e0d2bf1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                          fit: BoxFit.fitWidth,
                          width: 100,
                          height: 100,
                        ),
                        Image.network(
                          'https://plus.unsplash.com/premium_photo-1663100596017-043f4e0d2bf1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                          fit: BoxFit.fitWidth,
                          width: 100,
                          height: 100,
                        ),
                        Image.network(
                          'https://plus.unsplash.com/premium_photo-1663100596017-043f4e0d2bf1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                          fit: BoxFit.fitWidth,
                          width: 100,
                          height: 100,
                        )
                      ],
                    ),
                  ),
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
              );
  }
}
