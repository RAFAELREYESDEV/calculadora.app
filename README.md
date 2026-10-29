# Calculadora en Flutter - Programación III

Aplicación móvil de una calculadora básica desarrollada en Flutter para la evaluación práctica de la Unidad 2 de Programación III en la Universidad de Margarita (UNIMAR).

## Funcionalidades

- **Operaciones básicas:** Suma (+), Resta (-), Multiplicación (x) y División (/).
- **Botón C:** Borra el último número o espacio ingresado.
- **Botón CE:** Borra todo y reinicia la calculadora a cero.
- **Números:** Soporta números del 0 al 9, doble cero (00) y punto decimal (.).
- **Pantalla de información:** Muestra los datos del estudiante y tiene un botón para regresar a la calculadora.
- **Manejo de errores:** Si se divide entre 0 muestra "Error" en pantalla sin cerrarse la app.

## Estructura del proyecto

El código está organizado en carpetas sencillas dentro de `lib`:

```text
lib/
├── main.dart
├── rutas/
│   └── RUTAS.dart
├── pantallas/
│   ├── CALCULADORA.dart
│   └── INFORMACION.dart
└── widgets/
    └── BOTON.dart
```

- **`main.dart`**: Arranca la aplicación y carga las rutas.
- **`RUTAS.dart`**: Contiene la lista de rutas para navegar entre la calculadora y la pantalla de info.
- **`CALCULADORA.dart`**: Pantalla principal con los botones y las operaciones matemáticas.
- **`INFORMACION.dart`**: Pantalla con los datos del desarrollador y el botón para volver.
- **`BOTON.dart`**: Widget personalizado reutilizable para los botones de la calculadora.

## Cómo ejecutar la aplicación

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/RAFAELREYESMACH/calculator_app.git
   ```
2. Entrar en la carpeta del proyecto:
   ```bash
   cd calculator_app
   ```
3. Descargar las dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecutar en Chrome o emulador:
   ```bash
   flutter run
   ```

## Datos del desarrollador

- **Estudiante:** Rafael Reyes
- **Carrera:** Ingeniería de Sistemas
- **Universidad:** Universidad de Margarita (UNIMAR)
- **Materia:** Programación III (V-01)
- **Profesor:** Héctor Luna Huizzi
- **GitHub:** RAFAELREYESMACH
- **Correo:** rr2412128@gmail.com
