import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

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
      height: 60,
    );
  }

  Widget formulario() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
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
          const SizedBox(
            height: 38,
          ),
          etiquetaIzquierda("Nombre"),
          campoNombre(),
          const SizedBox(
            height: 25,
          ),
          etiquetaIzquierda("Correo electrónico"),
          campoCorreo(),
          const SizedBox(
            height: 25,
          ),
          etiquetaIzquierda("Contraseña"),
          campoPassword(),
          Container(
            child: etiquetaTexto(
                "La contraseña debe contener caracteres, números y símboloes \n con u minimo de 6 caracteres.",
                12.0,
                FontWeight.normal,
                Colors.black26),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              checkBox(),
              terminosCondiciones(),
            ],
          ),
          const SizedBox(
            height: 0,
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
      decoration: const InputDecoration(
          hintText: 'Nombre completo',
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5))),
    );
  }

  Widget campoCorreo() {
    return TextFormField(
      validator: (value) {},
      decoration: const InputDecoration(
          hintText: 'Direccion de correo',
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5))),
    );
  }

  Widget campoPassword() {
    return TextFormField(
      validator: (value) {},
      decoration: const InputDecoration(
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5))),
    );
  }

  Widget botonCrearCuenta() {
    return ElevatedButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.green,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            minimumSize: Size(300, 50)),
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
      width: 300,
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
            etiquetaTexto("términos y condicionbes ", fontSize,
                FontWeight.normal, Colors.red),
          ],
        ),
        Row(
          children: [
            etiquetaTexto("y la ", fontSize, FontWeight.normal, Colors.black),
            etiquetaTexto("policica de privacidad ", fontSize,
                FontWeight.normal, Colors.red),
          ],
        )
      ],
    );
  }
}
