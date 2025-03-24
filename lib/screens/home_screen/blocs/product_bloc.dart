class Product {
  final String id;
  final String name;
  final double price;
  final double rate;
  final int countOfReview;
  final String image;

  Product({required this.id, required this.name, required this.price, required this.rate, required this.countOfReview, required this.image});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'rate': rate,
      'countOfReview': countOfReview,
      'image': image,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      rate: json['rate'],
      countOfReview: json['countOfReview'],
      image: json['image'],
    );
  }
}

