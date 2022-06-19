import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var height, width, size;

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      if (kDebugMode) {
        print('Valido');
      }
    }
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: titulo(),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(child: formulario()),
    );
  }

  Widget titulo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [const Text('Regístrate'), logo()],
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
          etiquetaTexto("Crea una cuenta para empezar a usar la app", 15.0,
              FontWeight.bold, Colors.black54),
          SizedBox(
            height: height * 0.058,
          ),
          etiquetaIzquierda("Nombre"),
          campoNombre(),
          SizedBox(
            height: height * 0.04,
          ),
          etiquetaIzquierda("Correo electrónico"),
          campoCorreo(),
          SizedBox(
            height: height * 0.04,
          ),
          etiquetaIzquierda("Contraseña"),
          campoPassword(),
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            padding: EdgeInsets.only(left: width * 0.05),
            child: etiquetaTexto(
                "La contraseña debe contener caracteres, números y símbolos\ncon un minimo de 6 caracteres.",
                12.0,
                FontWeight.normal,
                Colors.black26),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Row(
            children: [
              checkBox(),
              terminosCondiciones(),
            ],
          ),
          SizedBox(
            height: height * 0.06,
          ),
          botonCrearCuenta(),
          Center(
            child: tienesCuenta(),
          )
        ],
      ),
    );
  }

  Widget campoNombre() {
    return TextFormField(
      validator: (value) {},
      decoration: InputDecoration(
          hintText: 'Nombre completo',
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget campoCorreo() {
    return TextFormField(
      validator: (value) {},
      decoration: InputDecoration(
          hintText: 'Direccion de correo',
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget campoPassword() {
    return TextFormField(
      validator: (value) {},
      decoration: InputDecoration(
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget botonCrearCuenta() {
    return ElevatedButton(
        onPressed: () {
          print(height);
          print(width);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.3, vertical: width * 0.03),
          primary: Colors.white,
          backgroundColor: Colors.green,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          "Crear Cuenta",
          style: TextStyle(fontSize: 18),
        ));
  }

  Widget etiquetaIzquierda(texto) {
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

  Widget etiquetaTexto(texto, fontSize, fontWeight, colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          texto,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: colors),
        )
      ],
    );
  }

  Widget terminosCondiciones() {
    return Container(
      width: width * 0.73,
      alignment: Alignment.centerLeft,
      child: msjTerminosCondiciones(),
    );
  }

  Widget tienesCuenta() {
    double fontSize = 15.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        etiquetaTexto("¿Ya tienes una cuenta?", fontSize, FontWeight.normal,
            Colors.black),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: etiquetaTexto(
                "Inicia sesión ", fontSize, FontWeight.bold, Colors.red)),
      ],
    );
  }

  Widget checkBox() {
    return Checkbox(
      shape: CircleBorder(),
      value: this.value,
      onChanged: (bool? value) {
        setState(() {
          this.value = value!;
        });
      },
    );
  }

  Widget msjTerminosCondiciones() {
    double fontSize = 13.0;
    return Column(
      children: [
        Row(
          children: [
            etiquetaTexto("Al registrarme, acepto los ", fontSize,
                FontWeight.normal, Colors.black),
            etiquetaTexto("términos y condiciones ", fontSize,
                FontWeight.normal, Colors.red),
          ],
        ),
        Row(
          children: [
            etiquetaTexto("y la ", fontSize, FontWeight.normal, Colors.black),
            etiquetaTexto("politica de privacidad ", fontSize,
                FontWeight.normal, Colors.red),
          ],
        )
      ],
    );
  }
}
