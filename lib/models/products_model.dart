class Products {
  late final int id;
  late final String title;
  late final double price;
  late final String description;
  late final String category;
  late final String image;
  // Rating rating;

  Products({required this.id,required this.title, required this.price, required this.description, required this.category, required this.image,});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] =title;
    data['price'] = price;
    data['description'] =description;
    data['category'] =category;
    data['image'] = image;

    return data;
  }
}

// class Rating {
//   double? rate;
//   int? count;
//
//   Rating({this.rate, this.count});
//
//   Rating.fromJson(Map<String, dynamic> json) {
//     rate = json['rate'];
//     count = json['count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rate'] = this.rate;
//     data['count'] = this.count;
//     return data;
//   }
// }