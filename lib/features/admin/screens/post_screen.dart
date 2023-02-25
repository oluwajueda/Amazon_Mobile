// ignore_for_file: prefer_const_constructors

import 'package:amazon_mobile/common/widgets/loader.dart';
import 'package:amazon_mobile/features/account/widgets/single_product.dart';
import 'package:amazon_mobile/features/admin/screens/add_product.dart';
import 'package:amazon_mobile/features/admin/services/admin_services.dart';
import 'package:amazon_mobile/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: (() {
          products!.removeAt(index);
          setState(() {});
        }));
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(image: productData.images[0]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text(
                          productData.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                        IconButton(
                          onPressed: () => deleteProduct(productData, index),
                          icon: Icon(Icons.delete_outline),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddProduct,
              tooltip: "Add a Product",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
