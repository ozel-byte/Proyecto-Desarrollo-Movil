//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final databaseReference = FirebaseDatabase.instance.ref("personas");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  late String name;
  late String email;
  late String img;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [logo(size), signIn(size, context), signUp(size)],
      ),
    );
  }

  Widget logo(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.4,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth, image: AssetImage("assets/B5.png"))),
    );
  }

  Widget signIn(Size size, BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    _signInWidthGoogle().then((r) {
                      if (r != null) {
                        print("entr");
                      }
                    });
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.width * 0.24, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff3069F5))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.g_mobiledata_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "Continuar con google",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.width * 0.20, vertical: 10
                        )
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xff65676F)),
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff314FA4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continuar con Facebook",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.width * 0.20, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xff65676F)),
                          borderRadius: BorderRadius.circular(20)))),
                  child: Row(
                    children: [
                      Icon(Icons.mail, color: Color(0xff65676F)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Registrarse con e-mail",
                        style: TextStyle(color: Color(0xff65676F)),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget signUp(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Entrar como invitado",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            "Entrar como vendedor",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("¿Ya tienes una cuenta?"),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Text(
                  "Iniciar sesion",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () => Navigator.pushNamed(context, "loginEmail"),
              )
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  _signInWidthGoogle() async {
    final googleSignInAccount = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user!;

    if (user != null) {
      // Checking if email and name is null
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      name = user.displayName!;
      email = user.email!;
      img = user.photoURL!;

      // Only taking the first part of the name, i.e., First Name
      if (name.contains(" ")) {
        name = name.substring(0, name.indexOf(" "));
      }

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser!;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }

    return null;
  }
}
