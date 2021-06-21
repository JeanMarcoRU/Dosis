class Historial {
  String rMedicamento, cuentaEmail;
  bool fueTomado;
  DateTime fecha;

  //La idea es crear el historial por medicamentos
  Historial({this.rMedicamento, this.cuentaEmail, this.fecha, this.fueTomado});
}

List<Historial> historial = [];
