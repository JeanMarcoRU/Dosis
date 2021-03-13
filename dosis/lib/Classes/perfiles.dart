import 'package:dosis/constants.dart';
import 'package:flutter/material.dart';

class Perfil {
  final String letralogo, nombre, apellido, descripcion;
  final int edad;
  final Color color;
  Perfil({
    this.letralogo,
    this.nombre,
    this.apellido,
    this.descripcion,
    this.edad,
    this.color,
  });
}

List<Perfil> perfiles = [
  Perfil(
      letralogo: "J",
      nombre: "Jean Marco",
      apellido: "Rojas",
      descripcion: "fresco como lechuga",
      edad: 23,
      color: userblueColor),
  Perfil(
      letralogo: "Y",
      nombre: "Yanina",
      apellido: "Contreras",
      descripcion: "fresca como lechuga",
      edad: 23,
      color: usergreenColor),
  Perfil(
      letralogo: "V",
      nombre: "Victor",
      apellido: "Víquez",
      descripcion: "fresco como lechuga",
      edad: 23,
      color: userpurpleColor),
];
