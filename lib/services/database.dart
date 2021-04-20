import 'package:brewcrewtrue/models/animal.dart';
import 'package:brewcrewtrue/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//  Functions using services provided by cloud firestore
class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference animalInfo = Firestore.instance.collection('animals');

  Future updateUserData(String location, String name, bool isAdmin, int temperature, int restingTime, String currUid) async {
    return await animalInfo.document(currUid).setData({
      'location': location,
      'name': name,
      'isAdmin': isAdmin,
      'temperature': temperature,
      'restingTime': restingTime,
      'animalId': currUid,
    });
  }

  // animal list from snapshot
  List<Animal> _animalListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Animal(
        name: doc.data['name'] ?? '',
        location: doc.data['location'] ?? '',
        temperature: doc.data['temperature'] ?? 0,
        restingTime: doc.data['restingTime'] ?? 0,
        animalId: doc.data['animalId'] ?? '',
      );
    }).toList();
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      isAdmin: snapshot.data['isAdmin'],
      location: snapshot.data['location'],
      temperature: snapshot.data['temperature'],
      restingTime: snapshot.data['restingTime'],
    );
  }

  // get animals stream
  Stream<List<Animal>> get animals {
    return animalInfo.snapshots()
        .map(_animalListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return animalInfo.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}