import 'package:ecommerce/views/login/register_screen.dart';
import 'package:ecommerce/Controller/services/firebase_auth_methods.dart';
import 'package:ecommerce/views/widgets/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();
  // final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // void signUser() {
  //   FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
  //       email: emailcontroller.text,
  //       password: passwordcontroller.text,
  //       context: context);
  // }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 150,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 162, top: 15),
              child: SmallText(text: "Please sign in to continue"),
            ),
            const SizedBox(
              height: 35,
            ),
            Form(
              // key: _key,
              child: Column(
                children: [
                  SizedBox(
                      width: 325,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: emailcontroller,
                        maxLines: 1,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 58, 72, 89),
                          filled: true,
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(176, 255, 250, 250)),
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 325,
                    child: TextFormField(
                      controller: passwordcontroller,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 58, 72, 89),
                        filled: true,
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(175, 204, 179, 179)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const RegisterPage(title: 'Register UI'),
                            //   ),
                            // );
                          },
                          child: TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.sendPasswordResetEmail(
                                    email: emailcontroller.text.trim());
                              },
                              child: const Text("Forogot your password ?"))),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 325,
                    height: 55,
                    child: ElevatedButton(
                      autofocus: false,
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailcontroller.text.trim(),
                            password: passwordcontroller.text.trim());

                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 80, 76, 76)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const RegisterPage(title: 'Register UI'),
                          //   ),
                          // );
                        },
                        child: SmallText(text: 'or log in with '),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 155,
                          height: 45,
                          child: SignInButton(
                            Buttons.google,
                            text: " Google",
                            onPressed: () async {
                              await FirebaseAuthMethods().signInWithGoogle();
                              Navigator.pop(context);
                            },
                          )),
                      const SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                          width: 155,
                          height: 45,
                          child: SignInButton(
                            Buttons.facebook,
                            text: " facebook",
                            onPressed: () {
                              // FirebaseAuthMethods(FirebaseAuth.instance)
                              //     .signInWithFacebook;
                            },
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(text: 'not a member?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ));
                          },
                          child: const Text("Register now"))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
