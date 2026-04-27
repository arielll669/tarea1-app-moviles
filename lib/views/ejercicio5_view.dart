import 'package:flutter/material.dart';
import '../controllers/conversion_metros_controller.dart';

/// ATOMO Widgets

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
        hintText: 'Ej. 5, 10, 2.5',
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

/// MOLECULAS combinación de átomos

class MetrosInput extends StatelessWidget {
  final TextEditingController controller;
  MetrosInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText('Ingrese metros:'),
        SizedBox(height: 10),
        NumberField(controller: controller),
      ],
    );
  }
}

/// ORGANISMO statefulWidget con lógica

class ConversionMetrosCard extends StatefulWidget {
  @override
  State<ConversionMetrosCard> createState() => ConversionMetrosCardState();
}

class ConversionMetrosCardState extends State<ConversionMetrosCard> {
  final TextEditingController _controllerMetros = TextEditingController();
  final ConversionMetrosController controller = ConversionMetrosController();

  String _resultado = '';

  void convertir() {
    setState(() {
      _resultado = controller.convertir(_controllerMetros.text);
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
            MetrosInput(controller: _controllerMetros),
            SizedBox(height: 12),
            Boton(onPressed: convertir, text: 'Convertir metros'),
            SizedBox(height: 20),
            ResultadoEtiqueta(texto: _resultado),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerMetros.dispose();
    super.dispose();
  }
}

/// PAGINA estructura principal

class Ejercicio5Pagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversión de metros'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: ConversionMetrosCard(),
      ),
    );
  }
}
