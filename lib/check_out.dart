import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/items.dart';
import 'package:store_app/provider/cart_provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckOut'),
      ),
      body: Consumer<CartProvider>(builder: (context,cart,_){
        return ListView.builder(itemCount: cart.cartItem.length ,itemBuilder: (context,index){
          return Card(
            child: ListTile(
              leading: Image.network('${cart.cartItem[index].image}'),
              title: Text('${cart.cartItem[index].title}'),
              subtitle:Text('\$${cart.cartItem[index].price.toString()}') ,
              trailing: IconButton(
                onPressed: (){
                  cart.removeFromFavourite(cart.cartItem[index]);
                },
                icon: Icon(Icons.remove),
              ),
            ),
          );
        });
      },),

    );
  }
}
