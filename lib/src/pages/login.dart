//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyectocorte3/src/pages/login_email.dart';
import 'package:proyectocorte3/src/pages/signup.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final databaseReference = FirebaseDatabase.instance.ref("personas");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late AnimationController _animationController;

  late String name;
  late String email;
  late String img;

  late Animation<double> movex;
  late Animation<double> movey;
  late Animation<double> opacity;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    movex = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.25)));

    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.25, 0.75, curve: Curves.easeInCubic)));

    movey = Tween(begin: -100.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1, curve: Curves.easeInOutCubicEmphasized)));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [logo(size), signIn(size, context), signUp(size)],
      ),
    );
  }

  Widget logo(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Hero(
              tag: "logo",
              child: Builder(builder: (context) {
                return AnimatedBuilder(
                  animation: _animationController,
                  builder: (_, child) {
                    return Transform.translate(
                      offset: Offset(0, movey.value),
                      child: Opacity(
                        opacity: opacity.value,
                        child: Image(
                            height: size.height * 0.3,
                            image: const AssetImage("assets/B5.png")),
                      ),
                    );
                  },
                );
              })),
        ],
      ),
    );
  }

  Widget signIn(Size size, BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    _signInWidthGoogle().then((r) {
                      if (r != null) {
                        print("entrando");
                      }
                    });
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.width * 0.2, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff3069F5))),
                  child: Row(
                    children: const [
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
              SizedBox(
                height: size.height * 0.03,
              ),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.height * 0.08, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xff65676F)),
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff314FA4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
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
              SizedBox(
                height: size.height * 0.04,
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, 'signup');
                    Navigator.push(
                        context,
                        PageTransition(
                            child: signup(),
                            type: PageTransitionType.bottomToTop));
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.height * 0.085, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xff65676F)),
                          borderRadius: BorderRadius.circular(20)))),
                  child: Row(
                    children: const [
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
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          const Text(
            "Entrar como invitado",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          const Text(
            "Entrar como vendedor",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("¿Ya tienes una cuenta?"),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: const Text(
                  "Iniciar sesion",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: LoginEmail(),
                          type: PageTransitionType.bottomToTop));
                },
              )
            ],
          ),
          const SizedBox(
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
