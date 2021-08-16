import 'package:flutter/material.dart';

class Conseil{
  final String text;
  Conseil(this.text);
  @override
  String toString() {
    return text;
  }
}

class Conseils{
  static final conseilVide = Conseil('');
  static final cinqFruits = Conseil("Pour ta santé, mange au moins cinq fruits et légumes par jours");

  static List<Conseil> asList = [cinqFruits];
}