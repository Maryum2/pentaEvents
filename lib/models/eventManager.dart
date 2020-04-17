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
  //final List<String> servingAreas;

  EventManager({ this.uid, this.email, this.password, this.username,
    this.cnic, this.phone, this.address, this.orgName,this.servingAreas

  });


  Future<void> addToDatabase(String name,
      String email,
      String password,
      String orgName,
      String cnic,
      String phone,
      String address,
      String servingArea,
     // List<String> servingAreas
//    String uid,
//    String cnic,
//    String phone, String address

      ) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    Firestore.instance.collection('Event_manager').document(user.uid).setData({
      'Event_name': name,
      'Event_password': password,
      'Event_orgName' : orgName,
      'Event_cnic': cnic,
      'Event_phone': phone,
      'Event_address': address,
      'Event_serving_areas' : servingArea,
      'Event_id': user.uid,

    });
  }
}
