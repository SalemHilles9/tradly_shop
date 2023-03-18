import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tradly_shope/presentation/model/product.dart';
import 'package:tradly_shope/presentation/model/top_image.dart';

import '../../presentation/model/categorie.dart';

class FierstoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<TopImage>> getAllTopImages(){
    return _firebaseFirestore.collection('topImages').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => TopImage.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Categorie>> getAllCategories(){
    return _firebaseFirestore.collection('Categorie').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Categorie.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Product>> getAllProducts(){
    return _firebaseFirestore.collection('Product').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
