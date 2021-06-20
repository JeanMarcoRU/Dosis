import 'package:flutter/material.dart';

class Categoria {
  String cuentaEmail, idCategoria, letralogo, nombre, descripcion, emoji;
  Color color;

  //void cargaPerfiles();
  Categoria(
      {this.cuentaEmail,
      this.idCategoria,
      this.letralogo,
      this.nombre,
      this.descripcion,
      this.emoji,
      this.color});
}

List<Categoria> categorias = [];
