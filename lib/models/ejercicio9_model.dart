class Ejercicio9Model {
  
  // Calcula el promedio de una lista de producciones diarias
  static double calcularPromedio(List<int> produccionSemanal) {
    if (produccionSemanal.isEmpty) return 0.0;
    
    int suma = 0;
    for (int produccion in produccionSemanal) {
      suma += produccion;
    }
    
    return suma / produccionSemanal.length;
  }

  // Verifica si el promedio alcanza el mínimo de 100 unidades
  static bool recibeIncentivo(double promedio) {
    return promedio >= 100;
  }
}