class ConversionMetrosModel {
  /// Calcula todas las conversiones de metros a otras unidades
  // metros: valor en metros a convertir
  /// Retorna un mapa con los resultados: cm, pulgadas, pies, yardas
  Map<String, double> convertir(double metros) {
    double cm = metros * 100;
    double pulgadas = cm / 2.54;
    double pies = pulgadas / 12;
    double yardas = pies / 3;

    return {
      'centimetros': cm,
      'pulgadas': pulgadas,
      'pies': pies,
      'yardas': yardas,
    };
  }
}
