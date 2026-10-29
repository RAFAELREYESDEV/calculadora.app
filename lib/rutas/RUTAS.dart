import 'package:flutter/material.dart';
import '../pantallas/CALCULADORA.dart';
import '../pantallas/INFORMACION.dart';

class MisRutas {
  static String inicio = '/';

  static Map<String, WidgetBuilder> rutas = {
    '/': (BuildContext context) => const PantallaCalculadora(),
    '/info': (BuildContext context) => const PantallaInfo(),
  };
}
