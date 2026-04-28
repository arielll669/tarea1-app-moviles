import '../models/finanza_model.dart';

class FinanzaController {
  final FinanzaModel _model = FinanzaModel();

  String calcular(String entrada) {
    if (entrada.isEmpty) {
      return 'Error: El campo no puede estar vacío';
    }

    double? monto = double.tryParse(entrada);

    if (monto == null) {
      return 'Error: Debe ingresar un número válido';
    }

    if (monto <= 0) {
      return 'Error: El monto debe ser positivo';
    }

    double cuota = _model.calcularCuota(monto);

    return 'Monto de la fianza: \$${monto.toStringAsFixed(2)}\n'
        'Cuota a pagar: \$${cuota.toStringAsFixed(2)}';
  }
}