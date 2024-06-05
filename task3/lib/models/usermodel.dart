import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  static CollectionReference<Map<String, dynamic>> get collection =>
      FirebaseFirestore.instance.collection('posts');
  static DocumentReference<Map<String, dynamic>> doc(String? id) =>
      collection.doc(id);
  final String name;
  final String age;

  Usermodel({required this.name, required this.age});

  factory Usermodel.fromSnapshot(DocumentSnapshot doc) {
    return Usermodel(
      name: doc['name'] ?? '',
      age: doc['age'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
      };
}
