import 'package:flutter/material.dart';
import '/informacion.dart';
import '/niveles/nivel_5.dart';
import '/niveles/nivel_snape.dart';
import '/niveles/nivel_3.dart';
import '/niveles/nivel_4.dart';
import '/final.dart';
import '/inicio.dart';
import '/niveles/nivel_1.dart';
import '/niveles/nivel_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Perdido en Hogwarts", debugShowCheckedModeBanner: false, initialRoute: '/rutaInicio', routes: {
      '/rutaInicio': (BuildContext context) => Inicio(),
      '/rutaInfo': (BuildContext context) => Informacion(),
      '/rutaNivel1': (BuildContext context) => Laberinto(),
      '/rutaNivel2': (BuildContext context) => Laberinto2(),
      '/rutaNivel3': (BuildContext context) => Laberinto3(),
      '/rutaNivel4': (BuildContext context) => Laberinto4(),
      '/rutaNivel5': (BuildContext context) => Laberinto5(),
      '/rutaNivelSnape': (BuildContext context) => LaberintoSnape(),
      '/rutaFinal': (BuildContext context) => Finale(),
    });
  }
}
