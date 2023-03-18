import 'package:cloud_firestore/cloud_firestore.dart';

class TopImage {
  String? imageUrl;

  TopImage({
    required this.imageUrl,
  });


  static TopImage fromSnapshot
      (DocumentSnapshot snap) {
    TopImage topImage = TopImage(imageUrl: snap['imageUrl']);
    return topImage;
  }
}

