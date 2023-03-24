import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? Uid;
  DatabaseService({this.Uid } );

  // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("User");

  Future updateUserData(
       String fullname,
   
      String lastname,
      String phonenumber,
      String place) async {
    return await userCollection.doc(Uid).update({
      "fullName": fullname,
    
       "lastname":lastname,
       "phonenumber":phonenumber,
       "place":place
     
    });
  }

  // save Userdata

  Future saveUserData(String fullname, String lastname, String email,
      String phonenumber, String place) async {
    return await userCollection.doc(Uid).set({
      "fullName": fullname,
      "lastname": lastname,
      "email": email,
      "Userid": Uid,
      "phone": phonenumber,
      "place": place,
    });
  }

  // getting user data

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  then(Null Function(dynamic snapshot) param0) {}


  
}
