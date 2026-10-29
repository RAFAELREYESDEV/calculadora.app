import 'package:flutter/material.dart';

class PantallaInfo extends StatelessWidget {
  const PantallaInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INFORMACION DEL ESTUDIANTE'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    'RR',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Rafael Reyes',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Estudiante de Ingenieria de Sistemas',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20.0),
                Card(
                  elevation: 4.0,
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.school),
                        title: Text('Universidad'),
                        subtitle: Text('Universidad de Margarita (UNIMAR)'),
                      ),
                      ListTile(
                        leading: Icon(Icons.book),
                        title: Text('Materia'),
                        subtitle: Text('Programacion III (V-01)'),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profesor'),
                        subtitle: Text('Hector Luna Huizzi'),
                      ),
                      ListTile(
                        leading: Icon(Icons.assignment),
                        title: Text('Evaluacion'),
                        subtitle: Text('Unidad 2 - Calculadora (15%)'),
                      ),
                      ListTile(
                        leading: Icon(Icons.code),
                        title: Text('GitHub'),
                        subtitle: Text('RAFAELREYESMACH'),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('Correo'),
                        subtitle: Text('rr2412128@gmail.com'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Volver a la Calculadora'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
