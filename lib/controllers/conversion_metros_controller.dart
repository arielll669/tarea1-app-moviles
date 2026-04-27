import '../models/conversion_metros_model.dart';

class ConversionMetrosController {
  final ConversionMetrosModel _model = ConversionMetrosModel();

  // Valida la entrada y realiza la conversión
  
  String convertir(String entrada) {
    // campo vacío
    if (entrada.isEmpty) {
      return 'Error: El campo no puede estar vacío';
    }

    //convertir a número
    double? metros = double.tryParse(entrada);
    if (metros == null) {
      return 'Error: Debe ingresar un número válido';
    }

    //número positivo
    if (metros <= 0) {
      return 'Error: El valor debe ser un número positivo';
    }

    Map<String, double> resultados = _model.convertir(metros);

    return 'Conversión de $metros metros:\n'
        'Centímetros: ${resultados['centimetros']!.toStringAsFixed(2)}\n'
        'Pulgadas: ${resultados['pulgadas']!.toStringAsFixed(2)}\n'
        'Pies: ${resultados['pies']!.toStringAsFixed(2)}\n'
        'Yardas: ${resultados['yardas']!.toStringAsFixed(2)}';
  }
}
