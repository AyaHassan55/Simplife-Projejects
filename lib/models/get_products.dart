import 'package:dio/dio.dart';
import 'package:store_app/models/products_model.dart';

class GetProducts{
  Future<List<Products>> getAllProduct() async{
    final response= await Dio().get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<Products> products = data.map((item) => Products.fromJson(item)).toList();
      return products;
    } else {
    throw Exception(
    'there is a problem with status code ${response.statusCode}');
    }
  }

}