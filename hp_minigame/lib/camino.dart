import 'package:flutter/material.dart';

// Camino
class MyPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      // child: Center(child: child),
      child: Image.asset('assets/path2.png'),
    );
  }
}

// Escaleras
class MyStair extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/stairs2.png')),
    );
  }
}

// Entrada
class MyEntrance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/path_entrance.png')),
    );
  }
}

// Entrada lateral
class MyEntranceLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/path_entrance_left.png')),
    );
  }
}

// Salida
class MyExit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/path_exit.png')),
    );
  }
}

// Salida lateral
class MyExitRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/path_exit_right.png')),
    );
  }
}
