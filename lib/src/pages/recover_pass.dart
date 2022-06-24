import 'package:flutter/material.dart';

class RecoverPass extends StatefulWidget {
  RecoverPass({Key? key}) : super(key: key);

  @override
  State<RecoverPass> createState() => _RecoverPassState();
}

class _RecoverPassState extends State<RecoverPass> {
   final GlobalKey<FormState> _formKey = GlobalKey();
  var height, width, size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: titulo(),
        backgroundColor: Colors.deepPurple
      ),
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
          etiquetaParrafo("Por seguridad, tu contraseña debe tener una longitud de entre 8 y 15 caracteres, usar mayúsculas, minúsculas, contener por lo menos un número y un caracter especial", 17.0,
              FontWeight.bold, Colors.black54, 1),
          SizedBox(
            height: height * 0.058,
          ),
          etiquetInput("Nueva contraseña"),
          campoInput('Nueva contraseña', 2  ),
          SizedBox(
            height: height * 0.03,
          ),
          etiquetInput("Confirmar nueva contraseña"),
          campoInput('Confirma tu nueva contraseña', 1),
          SizedBox( height: height *0.02,),
          
          SizedBox(height: height * 0.3),
          btnaRecuperar(),
          
        ],
      ),
    );
  }

  Widget etiquetaTexto(texto, fontSize, fontWeight, colors, posicion) {
    return Row(
      mainAxisAlignment: posicion == 1 ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Text(
          texto,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: colors),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }
   
   Widget etiquetaParrafo(texto, fontSize, fontWeight, colors, posicion) {
    return Row(
      mainAxisAlignment: posicion == 1 ? MainAxisAlignment.start : MainAxisAlignment.end,
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




  Widget btnaRecuperar() {
    return ElevatedButton(
        onPressed: null,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.08, vertical: 10
          ),
          primary: Colors.white,
          backgroundColor: Colors.green,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          "Actualizar contraseña",
          style: TextStyle(fontSize: 19, color: Colors.white),
        ));
  }
}