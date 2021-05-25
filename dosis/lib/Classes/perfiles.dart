import 'package:flutter/material.dart';

class Perfil {
  final String letralogo,
      avatar,
      nombre,
      apellido1,
      apellido2,
      numeroCedula,
      genero,
      tipoSangre,
      estadoCivil;
  final int edad;
  final Color color;
  final DateTime fechaNacimiento;
  //void cargaPerfiles();
  Perfil({
    this.letralogo,
    this.avatar,
    this.nombre,
    this.apellido1,
    this.apellido2,
    this.fechaNacimiento,
    this.numeroCedula,
    this.edad,
    this.color,
    this.genero,
    this.tipoSangre,
    this.estadoCivil,
  });
}

List<Perfil> perfiles = [];
