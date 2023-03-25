import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Package {
  String? id;
  String name;
  int price;
  String decoration;
  String catering;
  String photography;
  String music;

  Package(
      {required this.name,
      required this.price,
      required this.decoration,
      required this.catering,
      required this.photography,
      required this.music});

  factory Package.fromSnapshot(DocumentSnapshot snapshot) {
    return Package(
      name: snapshot.get('name'),
      price: snapshot.get('price'),
      decoration: snapshot.get('decoration'),
      catering: snapshot.get('catering'),
      photography: snapshot.get('photography'),
      music: snapshot.get('music'),
    );
  }
}
