import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventManager {

  final String uid;
  final String email;
  final String password;
  final String username;
  final String cnic;
  final String phone;
  final String address;
  final String orgName;
  final String servingAreas;
  final String cover;
  final String logo;
  final String description;

  //final List<String> servingAreas;

  EventManager({ this.uid,
    this.email, this.password, this.username,
    this.cnic, this.phone, this.address, this.orgName, this.servingAreas,this.cover,this.logo,this.description

  });

  final CollectionReference managerCollection = Firestore.instance.collection(
      "Event_manager");
  final DocumentReference managerDocument = Firestore.instance.collection(
      "Event_manger").document("Event_id");


  Future addToDatabase(String name,
      String email,
      String password,
      String orgName,
      String cnic,
      String phone,
      String address,
      String servingArea,
      String cover,
      String logo,
      String description



      ) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    managerCollection.document(user.uid).setData({
      'Event_name': name,
      'Event_password': password,
      'Event_orgName': orgName,
      'Event_cnic': cnic,
      'Event_phone': phone,
      'Event_address': address,
      'Event_serving_areas': servingArea,
      'Event_id': user.uid,
      'Event_email': email,
      'Event_Cover': cover,
      'Event_Logo': logo,
      'Description':description
    });
  }




//  manager data from snap shot
  EventManager _managerDataFromSnapshot(DocumentSnapshot snapshot) {
    return EventManager(
      uid: uid,
      email: snapshot.data['Event_email'],
      password: snapshot.data['Event_password'],
      username: snapshot.data['Event_name'],
      cnic: snapshot.data['Event_cnic'],
      phone: snapshot.data['Event_phone'],
      address: snapshot.data['Event_address'],
      orgName: snapshot.data['Event_orgName'],
      servingAreas: snapshot.data['Event_serving_areas'],
      cover: snapshot.data['Event_Cover'],
      logo: snapshot.data['Event_Logo'],
      description: snapshot.data['Description']


    );
  }
  // get manager doc stream
    Stream<EventManager> get managerdata{
    return managerCollection.document(uid).snapshots().map(_managerDataFromSnapshot);
  }

//get manager stream
  Stream<QuerySnapshot> get manager{
    return managerCollection.snapshots();
  }



}







//  Future updatePhoto(String photoUrl) async{
//    final FirebaseAuth _auth = FirebaseAuth.instance;
//    FirebaseUser user = await _auth.currentUser();
//    Firestore.instance.collection('Event_manager').document(user.uid).setData(data)
//
//  }




