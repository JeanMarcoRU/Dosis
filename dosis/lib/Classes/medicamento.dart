import 'package:flutter/material.dart';

class Medicamento {
  final String letralogo, nombre, dosis, tomaDesde, tomaHasta, dias, hora;

  //void cargaPerfiles();
  Medicamento(
      {this.letralogo,
      this.nombre,
      this.dosis,
      this.tomaDesde,
      this.tomaHasta,
      this.dias,
      this.hora});
}

List<Medicamento> medicamentos = [];