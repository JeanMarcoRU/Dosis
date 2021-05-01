import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';

class Perfil {
  final String letralogo,
      avatar,
      nombre,
      apellido1,
      apellido2,
      fechaNacimiento,
      numeroCedula;
  final int edad;
  final Color color;
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
  });
}

List<Perfil> perfiles = [];
