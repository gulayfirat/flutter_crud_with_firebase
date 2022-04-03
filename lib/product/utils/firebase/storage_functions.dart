import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../feature/addAndUpdatePage/model/model.dart';

class FirebaseStorageFunction {
  CollectionReference usersDataRef =
      FirebaseFirestore.instance.collection('usersData');
  Future<List<Model>?> getModels({required String ownedUID}) async {
    QuerySnapshot snapshot = await usersDataRef.get();
    final response = snapshot.docs.map((e) => e.data()).toList();
    if (response is List) {
      return response.map((e) => Model.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
