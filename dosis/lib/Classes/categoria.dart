import 'package:flutter/material.dart';
import 'package:dosis/Screens/UI/Pages/medicinas.dart';

class Categoria {
  final String letralogo, nombre, descripcion, emoji;

  //void cargaPerfiles();
  Categoria({this.letralogo, this.nombre, this.descripcion, this.emoji});
}

List<Categoria> categorias = [];
