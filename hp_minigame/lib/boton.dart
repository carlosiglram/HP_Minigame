import 'package:flutter/material.dart';
import '/niveles/nivel_5.dart';
import '/niveles/nivel_snape.dart';
import '/niveles/nivel_1.dart';
import '/niveles/nivel_2.dart';
import '/niveles/nivel_3.dart';
import '/niveles/nivel_4.dart';

// Botón Nivel 1
class MyButton extends StatelessWidget {
  final child;
  final function;
  static bool hold = false;

  MyButton({this.child, this.function});

  bool userHolding() {
    return hold;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          hold = true;
          Principal.score--;
          if (Principal.player == Principal.rows * 0 + 5) {
            Navigator.of(context).pushNamed("/rutaNivel2");
            mostrarInfo(context, "Nivel 2", "¡Enhorabuena! Avanzas al Nivel 2.\nHas conseguido " + Principal.score.toString() + " puntos en el Nivel 1.");
          }
          if (Principal.score == 0) {
            Navigator.of(context).pushNamed("/rutaNivel2");
            mostrarInfo(context, "Nivel 2", "Avanzas al Nivel 2 pero no has conseguido puntos en el Nivel 1.");
          }
          function();
        },
        onTapUp: (details) {
          hold = false;
        },
        child: boton(child));
  }
}

// Botón Nivel 2
class MyButton2 extends StatelessWidget {
  final child;
  final function;
  static bool hold = false;

  MyButton2({this.child, this.function});

  bool userHolding() {
    return hold;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          hold = true;
          Segunda.score--;
          if (Segunda.player == Segunda.rows * 0 + 5) {
            Navigator.of(context).pushNamed("/rutaNivel3");
            mostrarInfo(context, "Nivel 3", "¡Enhorabuena! Avanzas al Nivel 3.\nHas conseguido " + Segunda.score.toString() + " puntos en el Nivel 2.");
          }
          if (Segunda.score == 0) {
            Navigator.of(context).pushNamed("/rutaNivel3");
            mostrarInfo(context, "Nivel 3", "Avanzas al Nivel 3 pero no has conseguido puntos en el Nivel 2.");
          }
          function();
        },
        onTapUp: (details) {
          hold = false;
        },
        child: boton(child));
  }
}

// Botón Nivel 3
class MyButton3 extends StatelessWidget {
  final child;
  final function;
  static bool hold = false;

  MyButton3({this.child, this.function});

  bool userHolding() {
    return hold;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          hold = true;
          Tercera.score--;
          if (Tercera.player == Tercera.rows * 10 + 12) {
            Navigator.of(context).pushNamed("/rutaNivel4");
            mostrarInfo(context, "Nivel 4", "¡Enhorabuena! Avanzas al Nivel 4.\nHas conseguido " + Tercera.score.toString() + " puntos en el Nivel 3.");
          }
          if (Tercera.score == 0) {
            Navigator.of(context).pushNamed("/rutaNivel4");
            mostrarInfo(context, "Nivel 4", "Avanzas al Nivel 4 pero no has conseguido puntos en el Nivel 3.");
          }
          function();
        },
        onTapUp: (details) {
          hold = false;
        },
        child: boton(child));
  }
}

// Botón Nivel 4
class MyButton4 extends StatelessWidget {
  final child;
  final function;
  static bool hold = false;

  MyButton4({this.child, this.function});

  bool userHolding() {
    return hold;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          hold = true;
          Cuarta.score--;
          if (Cuarta.player == Cuarta.rows * 0 + 11) {
            Navigator.of(context).pushNamed("/rutaNivel5");
            mostrarInfo(context, "Nivel 5", "¡Enhorabuena! Avanzas al Nivel 5.\nHas conseguido " + Cuarta.score.toString() + " puntos en el Nivel 4.");
          }
          if (Cuarta.score == 0) {
            Navigator.of(context).pushNamed("/rutaNivel5");
            mostrarInfo(context, "Nivel 5", "Avanzas al Nivel 5 pero no has conseguido puntos en el Nivel 4.");
          }
          function();
        },
        onTapUp: (details) {
          hold = false;
        },
        child: boton(child));
  }
}

// Botón Nivel 5
class MyButton5 extends StatelessWidget {
  final child;
  final function;
  static bool hold = false;

  MyButton5({this.child, this.function});

  bool userHolding() {
    return hold;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          hold = true;
          Quinta.score--;
          if (Quinta.player == Quinta.rows * 0 + 5) {
            Navigator.of(context).pushNamed("/rutaNivelSnape");
            mostrarInfo(context, "Final", "¡Enhorabuena! Has llegado al piso donde está el aula de Pociones. Has conseguido " + Quinta.score.toString() + " puntos en el Nivel 5.");
          }
          if (Quinta.score == 0) {
            Navigator.of(context).pushNamed("/rutaNivelSnape");
            mostrarInfo(context, "Final", "Has llegado al piso donde está el aula de Pociones pero no has conseguido puntos en el Nivel 5.");
          }
          function();
        },
        onTapUp: (details) {
          hold = false;
        },
        child: boton(child));
  }
}

// Botón Nivel final - Snape
class MyButtonSnape extends StatelessWidget {
  final child;
  final function;
  static bool hold = false;

  MyButtonSnape({this.child, this.function});

  bool userHolding() {
    return hold;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          hold = true;

          function();
        },
        onTapUp: (details) {
          hold = false;
          if ((Sexta.player == Sexta.rows * 4 + 3)) {
            mostrarInfoSnape(context, "SNAPE", "Llegas tarde, Potter.\n25 puntos menos para Gryffindor.");
          }
        },
        child: boton(child));
  }
}

// Widget de botón genérico
Widget boton(final child) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Container(
      padding: EdgeInsets.all(10),
      color: Color.fromRGBO(217, 190, 108, 1),
      child: child,
    ),
  );
}

// Función de mensaje genérico
mostrarInfo(BuildContext context, String titulo, String contenido) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          shape: BeveledRectangleBorder(side: BorderSide(color: Color.fromRGBO(128, 109, 70, 1), width: 3), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
          backgroundColor: Color.fromRGBO(237, 219, 166, 1),
          title: Text(titulo, style: TextStyle(fontFamily: 'Dominican', fontSize: 20)),
          content: Text(contenido, style: TextStyle(fontFamily: 'Dominican', fontSize: 18)),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK", style: TextStyle(fontFamily: 'Dominican', color: Colors.black))),
          ],
        );
      });
}

// Función de mensaje del nivel de Snape
mostrarInfoSnape(BuildContext context, String titulo, String contenido) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          shape: BeveledRectangleBorder(side: BorderSide(color: Color.fromRGBO(128, 109, 70, 1), width: 3), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
          backgroundColor: Color.fromRGBO(237, 219, 166, 1),
          title: Text(titulo, style: TextStyle(fontFamily: 'Dominican', fontSize: 20)),
          content: Text(contenido, style: TextStyle(fontFamily: 'Dominican', fontSize: 18)),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/rutaFinal");
                  Principal.musicPlayerLaberintos.pause();
                },
                child: Text("OK", style: TextStyle(fontFamily: 'Dominican', color: Colors.black))),
          ],
        );
      });
}
