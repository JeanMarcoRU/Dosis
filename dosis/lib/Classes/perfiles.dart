import 'package:flutter/material.dart';

class Perfil {
  String idPerfil,
      letralogo,
      avatar,
      nombre,
      apellidos,
      numeroCedula,
      genero,
      tipoSangre,
      estadoCivil;
  int edad;
  Color color;
  DateTime fechaNacimiento;
  //void cargaPerfiles();
  Perfil({
    this.idPerfil,
    this.letralogo,
    this.avatar,
    this.nombre,
    this.apellidos,
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
List<Perfil> perfilAux = [];
List<String> avatares = [];
