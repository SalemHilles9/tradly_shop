import 'package:cloud_firestore/cloud_firestore.dart';

class Categorie{
  String? name;
  String? imageUrl;

  Categorie({required this.name,required this.imageUrl});

  static Categorie fromSnapshot
      (DocumentSnapshot snap) {
    Categorie categorie = Categorie(name: snap['name'],imageUrl: snap['imageUrl']);
    return categorie;
  }

}