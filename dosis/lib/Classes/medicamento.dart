import 'package:flutter/material.dart';

class Medicamento {
  String idMedicamento,
      letralogo,
      nombre,
      dosis,
      tomaDesde,
      tomaHasta,
      dias,
      hora;
  Color color;

  //void cargaPerfiles();
  Medicamento(
      {this.idMedicamento,
      this.letralogo,
      this.nombre,
      this.dosis,
      this.tomaDesde,
      this.tomaHasta,
      this.dias,
      this.hora,
      this.color});
}

List<Medicamento> medicamentos = [];
