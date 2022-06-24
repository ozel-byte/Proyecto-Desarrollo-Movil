import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var height, width, size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: titulo(), backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(child: formulario()),
    );
  }

  Widget titulo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [const Text('Recuperar contraseña'), logo()],
    );
  }

  Widget logo() {
    return Image.asset(
      'assets/B5.png',
      fit: BoxFit.contain,
      height: height / 15,
    );
  }

  Widget formulario() {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.07,
          top: height * 0.04,
          right: width * 0.07,
          bottom: height * 0.01),
      child: form(),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          etiquetaTexto("Ingresa tu email para restablecer tu contraseña", 15.7,
              FontWeight.bold, Colors.black54, 1),
          SizedBox(
            height: height * 0.058,
          ),
          etiquetInput("Correo electrónico"),
          campoInput('Dirección de correo', 2),
          SizedBox(
            height: height * 0.02,
          ),
          etiquetaParrafo(
              "Ingrese su correo electrónico registrado y le enviaremos un correo electrónico que contiene un enlace para restablecer su contraseña",
              13.6,
              FontWeight.normal,
              Colors.grey,
              1),
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.10,
          ),
          SizedBox(height: height * 0.34),
          btnEnviarSolicitud(),
        ],
      ),
    );
  }

  Widget etiquetaTexto(texto, fontSize, fontWeight, colors, posicion) {
    return Row(
      mainAxisAlignment:
          posicion == 1 ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Text(
          texto,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: colors),
        )
      ],
    );
  }

  Widget etiquetaParrafo(texto, fontSize, fontWeight, colors, posicion) {
    return Row(
      mainAxisAlignment:
          posicion == 1 ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        SizedBox(
          width: size.width * 0.86,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Text(
              texto,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: fontWeight, fontSize: fontSize, color: colors),
            ),
          ),
        )
      ],
    );
  }

  Widget etiquetInput(texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          texto,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    );
  }

  Widget campoInput(texto, bandera) {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: bandera == 1 ? Icon(Icons.remove_red_eye) : SizedBox(),
          hintText: texto,
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget btnEnviarSolicitud() {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'recoverPass');
        },
        style: TextButton.styleFrom(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.25, vertical: 15),
          primary: Colors.white,
          backgroundColor: Colors.green,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          "Enviar Solicitud",
          style: TextStyle(fontSize: 19, color: Colors.white),
        ));
  }
}
