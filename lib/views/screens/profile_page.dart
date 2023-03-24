import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Controller/helper_function.dart';
import '../../Controller/services/database_service.dart';
import '../../Controller/services/firebase_auth_methods.dart';
import '../widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "";
  String email = "";
  String phonenumber = "";
  String lastname = "";
  String place = "";
  FirebaseAuthMethods authService = FirebaseAuthMethods();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final double _opacity = 0.2;
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    gettingUserData();
  }

  //getuser data sf
  gettingUserData() async {
    await SharedPreferencesFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await SharedPreferencesFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
    await SharedPreferencesFunctions.getphoneFromSF().then((val) {
      setState(() {
        phonenumber = val!;
      });
    });
    await SharedPreferencesFunctions.getlastnameFromSF().then((val) {
      setState(() {
        lastname = val!;
      });
    });
    await SharedPreferencesFunctions.getplaceFromSF().then((val) {
      setState(() {
        place = val!;
      });
    });
    // getting the list of snapshots in our stream
    await DatabaseService(Uid: FirebaseAuth.instance.currentUser!.uid)
        .then((snapshot) {});
  }

  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                "https://th.bing.com/th/id/OIP.oBKDrg_iZIdKRwPkvCITtAHaNL?pid=ImgDet&rs=1",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45, right: 300),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ProfileWidget(
                    imagePath: (FirebaseAuth.instance.currentUser!.photoURL ??
                        "https://images.livemint.com/img/2023/01/02/1140x641/QATAR_1672651418421_1672651418589_1672651418589.jpg"),
                    onClicked: () {},
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(_opacity),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: const Icon(Icons.person),
                                    title: const Text(
                                      "Name",
                                    ),
                                    subtitle: Text(FirebaseAuth.instance
                                            .currentUser!.displayName ??
                                        userName),
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: const Icon(Icons.my_location),
                                    title: const Text("Location"),
                                    subtitle: Text(place),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.email),
                                    title: const Text("Email"),
                                    subtitle: Text(FirebaseAuth
                                            .instance.currentUser!.email ??
                                        email),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.phone),
                                    title: const Text("Phone"),
                                    subtitle: Text(phonenumber),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
