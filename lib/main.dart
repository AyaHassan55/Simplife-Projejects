import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/pages/cart_page.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/provider/cart_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int selectedIndex=0;
  void OnTap(int indx){
    setState(() {
      selectedIndex=indx;
    });
  }
  @override

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(

          body: selectedIndex ==0?HomePage():Container(color: Colors.blueGrey,),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,

            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'profile'),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: selectedIndex,
            onTap: OnTap,

          ),
        ),


      ),
    );
  }
}

