import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/check_out.dart';
import 'package:store_app/provider/cart_provider.dart';

import '../models/items.dart';
import '../models/products_model.dart';
import '../models/get_products.dart';
import 'cart_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  Widget build(BuildContext context) {
  var adding=context.read<CartProvider>();
  return Scaffold(
    appBar: AppBar(
        title: const Text(
          'Store app',
          style: TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return CheckOut();
                    }),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.orange,
                )),
          )
        ],
      ),
      body: ListView(
      children: [
        SizedBox(
          height: 670,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 13),
            child: FutureBuilder<List<Products>>(
              future: GetProducts().getAllProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Products> products = snapshot.data!;
                  return GridView.builder(
                      shrinkWrap: true,
                      clipBehavior: Clip.none,
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 60,
                        crossAxisSpacing: 22,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 20,
                              child: Container(
                                height: 100, width: 180,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),spreadRadius: 5, blurRadius: 7, offset:const Offset(0, 3), ),] ),

                            ),),
                            Positioned(left: 90, bottom: 60, child: Image.network(product.image, width: 70, height: 95,)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                 Text(product.title.substring(0,8),style:const TextStyle(color: Colors.grey),),
                                  Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '\$${product.price.toString()}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 39,),
                                      Consumer<CartProvider>(
                                        builder: (context, cartProvider, _) {
                                          return IconButton(
                                            onPressed: () {
                                              cartProvider.addToFavourite(Item(image: product.image , price: product.price, title:product.title));
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    ),
  );
}}
