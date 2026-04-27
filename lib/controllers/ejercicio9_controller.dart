import '../models/ejercicio9_model.dart';

class Ejercicio9Controller {

  String verificarIncentivos(List<String> ingresosDiarios) {
    List<int> produccionSemanal = [];

    // 1. Validar campos en blanco y números válidos para los 6 días
    for (String ingreso in ingresosDiarios) {
      if (ingreso.trim().isEmpty) {
        return 'Por favor, complete la producción de todos los días.';
      }

      final numero = int.tryParse(ingreso.trim());

      if (numero == null) {
        return 'Ingrese solo números enteros válidos.';
      }

      if (numero < 0) {
        return 'La producción no puede ser un número negativo.';
      }

      produccionSemanal.add(numero);
    }

    // 2. Traer cálculos del Modelo
    final promedio = Ejercicio9Model.calcularPromedio(produccionSemanal);
    final recibeIncentivo = Ejercicio9Model.recibeIncentivo(promedio);

    // 3. Formatear y retornar el resultado
    String promedioTexto = promedio.toStringAsFixed(2);
    
    return recibeIncentivo
        ? '¡Recibe incentivo! Promedio: $promedioTexto unidades.'
        : 'NO recibe incentivo. Promedio: $promedioTexto unidades.';
  }
}