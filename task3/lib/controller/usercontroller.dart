import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task3/models/usermodel.dart';

class Usercontroller {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> addUser(Usermodel userdata) async {
    try {
      Map<String, dynamic> jsonData = userdata.toJson();

      await firestore.collection('User').add(jsonData);
      return 'user added successfully!';
    } catch (e) {
      throw 'Failed to Category data: $e';
    }
  }

  Stream<QuerySnapshot> getUserStream() {
    return firestore.collection('User').snapshots();
  }

  Future<String> delete(String id) async {
    try {
      await FirebaseFirestore.instance.collection('User').doc(id).delete();
      return "User deleted successfully";
    } catch (error) {
      return "Failed to delete data";
    }
  }

  Future<String> updateUser(Usermodel user, String docid) async {
    try {
      Map<String, dynamic> jsonData = user.toJson();

      await FirebaseFirestore.instance
          .collection('User')
          .doc(docid)
          .update(jsonData);
      return "User update successfully";
    } catch (error) {
      return "Failed to update data";
    }
  }
}
