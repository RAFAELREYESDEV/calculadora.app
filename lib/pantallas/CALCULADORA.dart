import 'package:flutter/material.dart';
import '../widgets/BOTON.dart';

class PantallaCalculadora extends StatefulWidget {
  const PantallaCalculadora({super.key});

  @override
  State<PantallaCalculadora> createState() => _PantallaCalculadoraState();
}

class _PantallaCalculadoraState extends State<PantallaCalculadora> {
  String valorPantalla = '0';
  String memoria = '';
  double? primerNumero;
  String tipoOperacion = '';
  bool debeBorrar = false;

  void presionarNumero(String num) {
    setState(() {
      if (debeBorrar == true || valorPantalla == '0' || valorPantalla == 'Error') {
        valorPantalla = num;
        debeBorrar = false;
      } else {
        if (valorPantalla.length < 15) {
          valorPantalla = valorPantalla + num;
        }
      }
    });
  }

  void presionarPunto() {
    setState(() {
      if (debeBorrar == true || valorPantalla == 'Error') {
        valorPantalla = '0.';
        debeBorrar = false;
      } else if (!valorPantalla.contains('.')) {
        valorPantalla = valorPantalla + '.';
      }
    });
  }

  void presionarOperacion(String op) {
    if (valorPantalla == 'Error') return;

    setState(() {
      double numActual = double.tryParse(valorPantalla) ?? 0.0;

      if (primerNumero != null && tipoOperacion != '' && debeBorrar == false) {
        calcularResultado();
        primerNumero = double.tryParse(valorPantalla) ?? 0.0;
      } else {
        primerNumero = numActual;
      }

      tipoOperacion = op;
      if (primerNumero.toString().endsWith('.0')) {
        memoria = primerNumero!.toInt().toString() + ' ' + op;
      } else {
        memoria = primerNumero.toString() + ' ' + op;
      }
      debeBorrar = true;
    });
  }

  void calcularResultado() {
    if (primerNumero == null || tipoOperacion == '' || valorPantalla == 'Error') {
      return;
    }

    setState(() {
      double segundoNumero = double.tryParse(valorPantalla) ?? 0.0;
      double total = 0.0;

      if (tipoOperacion == '+') {
        total = primerNumero! + segundoNumero;
      } else if (tipoOperacion == '-') {
        total = primerNumero! - segundoNumero;
      } else if (tipoOperacion == 'x' || tipoOperacion == '*') {
        total = primerNumero! * segundoNumero;
      } else if (tipoOperacion == '/' || tipoOperacion == '÷') {
        if (segundoNumero == 0) {
          valorPantalla = 'Error';
          memoria = '';
          primerNumero = null;
          tipoOperacion = '';
          debeBorrar = true;
          return;
        }
        total = primerNumero! / segundoNumero;
      }

      String primeroTexto = primerNumero.toString().endsWith('.0')
          ? primerNumero!.toInt().toString()
          : primerNumero.toString();
      String segundoTexto = segundoNumero.toString().endsWith('.0')
          ? segundoNumero.toInt().toString()
          : segundoNumero.toString();

      memoria = primeroTexto + ' ' + tipoOperacion + ' ' + segundoTexto + ' =';

      if (total.toString().endsWith('.0')) {
        valorPantalla = total.toInt().toString();
      } else {
        valorPantalla = total.toStringAsFixed(4);
        while (valorPantalla.contains('.') && (valorPantalla.endsWith('0') || valorPantalla.endsWith('.'))) {
          valorPantalla = valorPantalla.substring(0, valorPantalla.length - 1);
        }
      }

      primerNumero = null;
      tipoOperacion = '';
      debeBorrar = true;
    });
  }

  void borrarUno() {
    setState(() {
      if (valorPantalla == 'Error' || valorPantalla.length <= 1) {
        valorPantalla = '0';
      } else {
        valorPantalla = valorPantalla.substring(0, valorPantalla.length - 1);
      }
    });
  }

  void borrarTodo() {
    setState(() {
      valorPantalla = '0';
      memoria = '';
      primerNumero = null;
      tipoOperacion = '';
      debeBorrar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULADORA'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Informacion',
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      memoria,
                      style: const TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                    const SizedBox(height: 10.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        valorPantalla,
                        style: TextStyle(
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold,
                          color: valorPantalla == 'Error' ? Colors.redAccent : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      BotonCalculadora(
                        texto: 'CE',
                        colorFondo: Colors.redAccent,
                        alPresionar: borrarTodo,
                      ),
                      BotonCalculadora(
                        texto: 'C',
                        colorFondo: Colors.orangeAccent,
                        alPresionar: borrarUno,
                      ),
                      BotonCalculadora(
                        texto: '00',
                        colorFondo: const Color(0xFF34495E),
                        alPresionar: () => presionarNumero('00'),
                      ),
                      BotonCalculadora(
                        texto: '/',
                        colorFondo: Colors.indigo,
                        alPresionar: () => presionarOperacion('/'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BotonCalculadora(
                        texto: '7',
                        alPresionar: () => presionarNumero('7'),
                      ),
                      BotonCalculadora(
                        texto: '8',
                        alPresionar: () => presionarNumero('8'),
                      ),
                      BotonCalculadora(
                        texto: '9',
                        alPresionar: () => presionarNumero('9'),
                      ),
                      BotonCalculadora(
                        texto: 'x',
                        colorFondo: Colors.indigo,
                        alPresionar: () => presionarOperacion('x'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BotonCalculadora(
                        texto: '4',
                        alPresionar: () => presionarNumero('4'),
                      ),
                      BotonCalculadora(
                        texto: '5',
                        alPresionar: () => presionarNumero('5'),
                      ),
                      BotonCalculadora(
                        texto: '6',
                        alPresionar: () => presionarNumero('6'),
                      ),
                      BotonCalculadora(
                        texto: '-',
                        colorFondo: Colors.indigo,
                        alPresionar: () => presionarOperacion('-'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BotonCalculadora(
                        texto: '1',
                        alPresionar: () => presionarNumero('1'),
                      ),
                      BotonCalculadora(
                        texto: '2',
                        alPresionar: () => presionarNumero('2'),
                      ),
                      BotonCalculadora(
                        texto: '3',
                        alPresionar: () => presionarNumero('3'),
                      ),
                      BotonCalculadora(
                        texto: '+',
                        colorFondo: Colors.indigo,
                        alPresionar: () => presionarOperacion('+'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BotonCalculadora(
                        texto: '0',
                        alPresionar: () => presionarNumero('0'),
                      ),
                      BotonCalculadora(
                        texto: '.',
                        alPresionar: presionarPunto,
                      ),
                      BotonCalculadora(
                        texto: '=',
                        colorFondo: Colors.teal,
                        alPresionar: calcularResultado,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
