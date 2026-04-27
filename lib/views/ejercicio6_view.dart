import 'package:flutter/material.dart';
import '../controllers/conversion_gb_controller.dart';

/// ATOMOS widgets básicos

class LabelText extends StatelessWidget {
  final String texto;
  LabelText(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}

class NumberField extends StatelessWidget {
  final TextEditingController controller;
  NumberField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Ej. 1, 2, 0.5',
      ),
    );
  }
}

class Boton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  Boton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class ResultadoEtiqueta extends StatelessWidget {
  final String texto;
  ResultadoEtiqueta({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}

/// MOLECULA combinación de átomos

class GigabytesInput extends StatelessWidget {
  final TextEditingController controller;
  GigabytesInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText('Ingrese gigabytes:'),
        SizedBox(height: 10),
        NumberField(controller: controller),
      ],
    );
  }
}

/// ORGANISMO statefulWidget con lógica

class ConversionGBCard extends StatefulWidget {
  @override
  State<ConversionGBCard> createState() => ConversionGBCardState();
}

class ConversionGBCardState extends State<ConversionGBCard> {
  final TextEditingController _controllerGB = TextEditingController();
  final ConversionGBController controller = ConversionGBController();

  String _resultado = '';

  void convertir() {
    setState(() {
      _resultado = controller.convertir(_controllerGB.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            GigabytesInput(controller: _controllerGB),
            SizedBox(height: 12),
            Boton(onPressed: convertir, text: 'Convertir gigabytes'),
            SizedBox(height: 20),
            ResultadoEtiqueta(texto: _resultado),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerGB.dispose();
    super.dispose();
  }
}

/// PAGINA estructura principal

class Ejercicio6Pagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversión de gigabytes'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: ConversionGBCard(),
      ),
    );
  }
}
