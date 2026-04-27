import '../models/conversion_gb_model.dart';

class ConversionGBController {
  final ConversionGBModel _model = ConversionGBModel();

  /// Valida la entrada y realiza la conversión

  String convertir(String entrada) {
    //campo vacío
    if (entrada.isEmpty) {
      return 'Error: El campo no puede estar vacío';
    }

    //convertir a número
    double? gigabytes = double.tryParse(entrada);
    if (gigabytes == null) {
      return 'Error: Debe ingresar un número válido';
    }
    //número positivo
    if (gigabytes <= 0) {
      return 'Error: El valor debe ser un número positivo';
    }


    Map<String, double> resultados = _model.convertir(gigabytes);

    return 'Conversión de $gigabytes GB:\n'
        'Megabytes (MB): ${resultados['megabytes']!.toStringAsFixed(2)}\n'
        'Kilobytes (KB): ${resultados['kilobytes']!.toStringAsFixed(2)}\n'
        'Bytes: ${resultados['bytes']!.toStringAsFixed(0)}';
  }
}
