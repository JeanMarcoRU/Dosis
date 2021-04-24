import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';

class Perfil {
  final String letralogo,
      nombre,
      apellido1,
      apellido2,
      fechaNacimiento,
      numeroCedula;
  final int edad;
  final Color color;
  Perfil({
    this.letralogo,
    this.nombre,
    this.apellido1,
    this.apellido2,
    this.fechaNacimiento,
    this.numeroCedula,
    this.edad,
    this.color,
  });
}

List<Perfil> perfiles = [
  Perfil(
      letralogo: "J",
      nombre: "Jean Marco",
      apellido1: "Rojas",
      fechaNacimiento: "fresco como lechuga",
      edad: 23,
      color: userblueColor),
  Perfil(
      letralogo: "Y",
      nombre: "Yanina",
      apellido1: "Contreras",
      fechaNacimiento: "fresca como lechuga",
      edad: 23,
      color: usergreenColor),
  Perfil(
      letralogo: "V",
      nombre: "Victor",
      apellido1: "Víquez",
      fechaNacimiento: "fresco como lechuga",
      edad: 23,
      color: userorangeColor),
];
