import 'package:flutter/material.dart';
import '../controllers/descuento_supermercado_controller.dart';

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
  final String hint;

  const NumberField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
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

class DescuentoInput extends StatelessWidget {
  final TextEditingController totalController;
  final TextEditingController numeroController;

  const DescuentoInput({
    super.key,
    required this.totalController,
    required this.numeroController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText('Ingrese el total de la compra:'),
        const SizedBox(height: 10),
        NumberField(controller: totalController, hint: 'Ej. 100'),
        const SizedBox(height: 15),
        const LabelText('Ingrese el número escogido al azar:'),
        const SizedBox(height: 10),
        NumberField(controller: numeroController, hint: 'Ej. 50'),
      ],
    );
  }
}

class DescuentoSupermercadoCard extends StatefulWidget {
  const DescuentoSupermercadoCard({super.key});

  @override
  State<DescuentoSupermercadoCard> createState() =>
      _DescuentoSupermercadoCardState();
}

class _DescuentoSupermercadoCardState
    extends State<DescuentoSupermercadoCard> {
  final TextEditingController _controllerTotal = TextEditingController();
  final TextEditingController _controllerNumero = TextEditingController();

  final DescuentoSupermercadoController controller =
      DescuentoSupermercadoController();

  String _resultado = '';

  void calcular() {
    setState(() {
      _resultado = controller.calcular(
        _controllerTotal.text,
        _controllerNumero.text,
      );
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
            DescuentoInput(
              totalController: _controllerTotal,
              numeroController: _controllerNumero,
            ),
            const SizedBox(height: 12),
            Boton(onPressed: calcular, text: 'Calcular descuento'),
            const SizedBox(height: 20),
            ResultadoEtiqueta(texto: _resultado),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerTotal.dispose();
    _controllerNumero.dispose();
    super.dispose();
  }
}

class Ejercicio10Pagina extends StatelessWidget {
  const Ejercicio10Pagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 10: Descuento supermercado'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: DescuentoSupermercadoCard(),
      ),
    );
  }
}
