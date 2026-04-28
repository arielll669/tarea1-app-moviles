import '../models/descuento_supermercado_model.dart';

class DescuentoSupermercadoController {
  final DescuentoSupermercadoModel _model = DescuentoSupermercadoModel();

  String calcular(String entradaTotal, String entradaNumero) {
    if (entradaTotal.isEmpty || entradaNumero.isEmpty) {
      return 'Error: Todos los campos son obligatorios';
    }

    double? totalCompra = double.tryParse(entradaTotal);
    int? numeroAzar = int.tryParse(entradaNumero);

    if (totalCompra == null || numeroAzar == null) {
      return 'Error: Ingrese valores numéricos válidos';
    }

    if (totalCompra <= 0) {
      return 'Error: El total de compra debe ser positivo';
    }

    if (numeroAzar < 0) {
      return 'Error: El número al azar no puede ser negativo';
    }

    double descuento = _model.calcularDescuento(totalCompra, numeroAzar);
    double totalPagar = totalCompra - descuento;

    return 'Total de compra: \$${totalCompra.toStringAsFixed(2)}\n'
        'Número escogido: $numeroAzar\n'
        'Descuento aplicado: \$${descuento.toStringAsFixed(2)}\n'
        'Total a pagar: \$${totalPagar.toStringAsFixed(2)}';
  }
}