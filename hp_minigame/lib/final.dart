// ignore_for_file: must_call_super

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '/main.dart';
import '/niveles/nivel_5.dart';
import '/niveles/nivel_snape.dart';
import '/niveles/nivel_3.dart';
import '/niveles/nivel_4.dart';
import '/niveles/nivel_2.dart';
import '/niveles/nivel_1.dart';

class Finale extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _fin();
}

class _fin extends State<Finale> {
  @override
  initState() {
    main();
    musicaFinal("music/final.mp3");
  }

  AudioPlayer musicPlayerFinal = AudioPlayer();
  musicaFinal(String rutaM) {
    musicPlayerFinal.play(AssetSource("music/final.mp3"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/fondos/bg_fin.png"),
          opacity: 0.8,
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "\nPUNTUACIÓN",
              style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 36),
            ),
            puntuaciones("Nivel 1:       ", Principal.score),
            puntuaciones("Nivel 2:       ", Segunda.score),
            puntuaciones("Nivel 3:       ", Tercera.score),
            puntuaciones("Nivel 4:       ", Cuarta.score),
            puntuaciones("Nivel 5:       ", Quinta.score),
            puntuaciones("Puntos restados:     ", 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "TOTAL:          ",
                    style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 32),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    (Sexta.puntuacionFinal).toString(),
                    style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 36),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                height: 70,
                width: 500,
                child: IconButton(
                    icon: Principal.score == 1000
                        ? Text(
                            "JUEGO SIGUIENTE",
                            style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 32),
                          )
                        : Text(
                            "CONTINUAR",
                            style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 32),
                          ),
                    onPressed: () {
                      next(context);
                      musicPlayerFinal.pause();
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  fin(BuildContext context) {
    Navigator.of(context).pushNamed("/rutaInicio");
  }

  next(BuildContext context) {
    Navigator.of(context).pushNamed("/rutaInicio");
  }

  Widget puntuaciones(String nivel, int puntos) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nivel,
            style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 32),
          ),
          Text(
            (puntos).toString(),
            style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 32),
          ),
        ],
      ),
    );
  }
}
