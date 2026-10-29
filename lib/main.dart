import 'package:flutter/material.dart';
import 'rutas/RUTAS.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData.dark(),
      initialRoute: MisRutas.inicio,
      routes: MisRutas.rutas,
    );
  }
}
