import 'package:flutter/material.dart';

class BotonCalculadora extends StatelessWidget {
  final String texto;
  final VoidCallback alPresionar;
  final Color colorFondo;
  final Color colorTexto;

  const BotonCalculadora({
    super.key,
    required this.texto,
    required this.alPresionar,
    this.colorFondo = const Color(0xFF2C3E50),
    this.colorTexto = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorFondo,
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          onPressed: alPresionar,
          child: Text(
            texto,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: colorTexto,
            ),
          ),
        ),
      ),
    );
  }
}
