import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  // This function is triggered when the "Save" button is pressed
  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      if (kDebugMode) {
        print('Got a valid input');
      }
      // And do something here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value != null && value.trim().length < 3) {
                    return 'This field requires a minimum of 3 characters';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Nombre completo',
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5))),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value != null && value.trim().length < 3) {
                    return 'This field requires a minimum of 3 characters';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Direccion de correo',
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5))),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value != null && value.trim().length < 3) {
                    return 'This field requires a minimum of 3 characters';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5))),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: _saveForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
