import 'package:flutter/material.dart';

class Medicamento {
  String cuentaEmail, idMedicamento, letralogo, nombre, dosis, hora, categoriaP;
  DateTime tomaDesde, tomaHasta;
  List dias;
  Color color;
  bool fueTomado;
  List historialM;

  //void cargaPerfiles();
  Medicamento(
      {this.cuentaEmail,
      this.idMedicamento,
      this.letralogo,
      this.fueTomado,
      this.nombre,
      this.dosis,
      this.tomaDesde,
      this.tomaHasta,
      this.categoriaP,
      this.dias,
      this.hora,
      this.historialM,
      this.color});
}

List<Medicamento> medicamentos = [];
