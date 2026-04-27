class ConversionGBModel {
  // Calcula todas las conversiones de GB a otras unidades
  // gigabytes: valor en GB a convertir
  // Retorna un mapa con los resultados: MB, KB, bytes
  Map<String, double> convertir(double gigabytes) {
    double megabytes = gigabytes * 1024;
    double kilobytes = gigabytes * 1024 * 1024;
    double bytes = gigabytes * 1024 * 1024 * 1024;

    return {
      'megabytes': megabytes,
      'kilobytes': kilobytes,
      'bytes': bytes,
    };
  }
}
