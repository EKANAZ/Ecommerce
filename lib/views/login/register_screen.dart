import 'package:ecommerce/views/screens/homepage.dart';
import 'package:flutter/material.dart';

import '../../Controller/helper_function.dart';
import '../../Controller/services/firebase_auth_methods.dart';

import '../widgets/showSnackbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  String email = "";
  String password = "";
  String fullname = "";

  String lastname = "";

  String phonenumber = "";
  String place = "";

  final formkey = GlobalKey<FormState>();

  FirebaseAuthMethods authService = FirebaseAuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: formkey,
                            child: TextFormField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                fillColor: const Color.fromARGB(255, 58, 72, 89),
                                filled: true,
                                hintText: 'First name',
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (Val) {
                                setState(
                                  () {
                                    fullname = Val;
                                  },
                                );
                              },
                              validator: (val) {
                                if (val!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "name cannot be empty ";
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              fillColor: const Color.fromARGB(255, 58, 72, 89),
                              filled: true,
                              hintText: 'Last name',
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (Val) {
                              setState(() {
                                lastname = Val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 58, 72, 89),
                        filled: true,
                        hintText: 'Enter your email',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (Val) {
                        setState(() {
                          email = Val;
                          print(email);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 58, 72, 89),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (val) {
                        if (val!.length < 6) {
                          return "password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (Val) {
                        setState(() {
                          password = Val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 58, 72, 89),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        hintText: 'phone',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (Val) {
                        setState(() {
                          phonenumber = Val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 58, 72, 89),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        hintText: 'place',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (Val) {
                        setState(() {
                          place = Val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Register();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 80, 76, 76),
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already registered?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Register() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .regisdterUserwithEmailandPassword(
              fullname, email, password, lastname, phonenumber, place)
          .then((value) async {
        if (value == true) {
          //  saving the shared preferences state
          await SharedPreferencesFunctions.saveUserLoggedInStatus(true);
          await SharedPreferencesFunctions.saveUserEmailSF(email);
          await SharedPreferencesFunctions.saveUserNameSF(fullname);
          await SharedPreferencesFunctions.saveUserphone(phonenumber);
          await SharedPreferencesFunctions.saveUserlastname(lastname);
          await SharedPreferencesFunctions.saveUserplace(place);
          nextScreenReplace(context, const HomePage());
        } else {
          showSnackbar(context, value, Colors.red);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
