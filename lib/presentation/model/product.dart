import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? name;
  String? imageUrl;
  String? price;
  String? description;

  Product({this.name, this.imageUrl, this.price, this.description});

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        description: snap['description']);
    return product;
  }
}
