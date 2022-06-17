//import 'dart:js';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
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
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
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
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
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
              Text(
                "Iniciar sesion",
                style: TextStyle(color: Colors.red),
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
}
