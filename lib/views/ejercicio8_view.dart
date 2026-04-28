import 'package:flutter/material.dart';
import '../controllers/finanza_controller.dart';

class LabelText extends StatelessWidget {
  final String texto;
  const LabelText(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}

class NumberField extends StatelessWidget {
  final TextEditingController controller;
  const NumberField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Ej. 45000',
      ),
    );
  }
}

class Boton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Boton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

class ResultadoEtiqueta extends StatelessWidget {
  final String texto;
  const ResultadoEtiqueta({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}

class FinanzaInput extends StatelessWidget {
  final TextEditingController controller;
  const FinanzaInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText('Ingrese el monto de la fianza:'),
        const SizedBox(height: 10),
        NumberField(controller: controller),
      ],
    );
  }
}

class FinanzaCard extends StatefulWidget {
  const FinanzaCard({super.key});

  @override
  State<FinanzaCard> createState() => _FinanzaCardState();
}

class _FinanzaCardState extends State<FinanzaCard> {
  final TextEditingController _controllerMonto = TextEditingController();
  final FinanzaController controller = FinanzaController();

  String _resultado = '';

  void calcular() {
    setState(() {
      _resultado = controller.calcular(_controllerMonto.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FinanzaInput(controller: _controllerMonto),
            const SizedBox(height: 12),
            Boton(onPressed: calcular, text: 'Calcular cuota'),
            const SizedBox(height: 20),
            ResultadoEtiqueta(texto: _resultado),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerMonto.dispose();
    super.dispose();
  }
}

class Ejercicio8Pagina extends StatelessWidget {
  const Ejercicio8Pagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 8: Cuota de fianza'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: FinanzaCard(),
      ),
    );
  }
}