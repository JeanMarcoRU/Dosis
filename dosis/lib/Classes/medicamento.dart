import 'package:flutter/material.dart';

class Medicamento {
  String idMedicamento, letralogo, nombre, dosis, hora, categoriaP;
  DateTime tomaDesde, tomaHasta;
  List dias;
  Color color;
  bool fueTomado;

  //void cargaPerfiles();
  Medicamento(
      {this.idMedicamento,
      this.letralogo,
      this.fueTomado,
      this.nombre,
      this.dosis,
      this.tomaDesde,
      this.tomaHasta,
      this.categoriaP,
      this.dias,
      this.hora,
      this.color});
}

List<Medicamento> medicamentos = [];
