import 'package:flutter/material.dart';
import 'package:dosis/Screens/UI/Pages/medicinas.dart';

class Categoria {
  String idCategoria, letralogo, nombre, descripcion, emoji;
  Color color;

  //void cargaPerfiles();
  Categoria(
      {this.idCategoria,
      this.letralogo,
      this.nombre,
      this.descripcion,
      this.emoji,
      this.color});
}

List<Categoria> categorias = [];
