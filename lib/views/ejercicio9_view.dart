import 'package:flutter/material.dart';
import '../controllers/ejercicio9_controller.dart';

/// atomos
class LabelText extends StatelessWidget {
  final String texto;

  LabelText(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
        hintText: 'Ej. 120',
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0)
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
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

/// Moléculas
class DiaInput extends StatelessWidget {
  final String nombreDia;
  final TextEditingController controller;

  DiaInput({super.key, required this.nombreDia, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: LabelText(nombreDia)),
          Expanded(flex: 3, child: NumberField(controller: controller)),
        ],
      ),
    );
  }
}

/// Organismos
class ProduccionCard extends StatefulWidget {
  @override
  State<ProduccionCard> createState() => ProduccionCardState();
}

class ProduccionCardState extends State<ProduccionCard> {
  // Controladores para los 6 días
  final TextEditingController _lunesCtrl = TextEditingController();
  final TextEditingController _martesCtrl = TextEditingController();
  final TextEditingController _miercolesCtrl = TextEditingController();
  final TextEditingController _juevesCtrl = TextEditingController();
  final TextEditingController _viernesCtrl = TextEditingController();
  final TextEditingController _sabadoCtrl = TextEditingController();

  final Ejercicio9Controller controller = Ejercicio9Controller();
  String _resultado = '';

  void calcularIncentivo() {
    // Recolectar datos de los TextFields
    List<String> ingresos = [
      _lunesCtrl.text,
      _martesCtrl.text,
      _miercolesCtrl.text,
      _juevesCtrl.text,
      _viernesCtrl.text,
      _sabadoCtrl.text,
    ];

    setState(() {
      _resultado = controller.verificarIncentivos(ingresos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView( // Previene desbordamientos en pantallas pequeñas
          child: Column(
            children: [
              Text(
                'Registro de Producción Semanal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DiaInput(nombreDia: 'Lunes:', controller: _lunesCtrl),
              DiaInput(nombreDia: 'Martes:', controller: _martesCtrl),
              DiaInput(nombreDia: 'Miércoles:', controller: _miercolesCtrl),
              DiaInput(nombreDia: 'Jueves:', controller: _juevesCtrl),
              DiaInput(nombreDia: 'Viernes:', controller: _viernesCtrl),
              DiaInput(nombreDia: 'Sábado:', controller: _sabadoCtrl),
              SizedBox(height: 20),
              Boton(onPressed: calcularIncentivo, text: 'Verificar'),
              SizedBox(height: 20),
              ResultadoEtiqueta(texto: _resultado),
            ],
          ),
        ),
      ),
    );
  }
}

/// Página
class Ejercicio9Pagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Incentivos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ProduccionCard(),
      ),
    );
  }
}