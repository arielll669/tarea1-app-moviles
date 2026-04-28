class DescuentoSupermercadoModel {
  double calcularDescuento(double totalCompra, int numeroAzar) {
    if (numeroAzar < 74) {
      return totalCompra * 0.15;
    } else {
      return totalCompra * 0.20;
    }
  }
}