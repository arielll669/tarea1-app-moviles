class FinanzaModel {
  double calcularCuota(double monto) {
    if (monto < 50000) {
      return monto * 0.03;
    } else {
      return monto * 0.02;
    }
  }
}