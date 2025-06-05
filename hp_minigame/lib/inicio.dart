// ignore_for_file: must_call_super

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '/main.dart';

class Inicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _inicio();
}

class _inicio extends State<Inicio> {
  @override
  initState() {
    main();
    musicaInicio("music/inicio.mp3");
  }

  AudioPlayer musicPlayer = AudioPlayer();
  musicaInicio(String rutaM) {
    musicPlayer.play(AssetSource("music/inicio.mp3"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/fondos/bg_inicio.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text("PERDIDO\nEN HOGWARTS", style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 36), textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              height: 90,
              width: 110,
              child: IconButton(
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Text("Jugar", style: TextStyle(fontFamily: 'TerraIgnota', color: Colors.black, fontSize: 52)),
                  onPressed: () {
                    jugar(context);
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              height: 80,
              width: 200,
              child: IconButton(
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Text("Información", style: TextStyle(fontFamily: 'TerraIgnota', color: Colors.black, fontSize: 52)),
                  onPressed: () {
                    info(context);
                  }),
            ),
          ),
        ]),
      ),
    ));
  }

  //Función del botón "START", nos lleva a la ventana principal.
  jugar(BuildContext context) {
    Navigator.of(context).pushNamed("/rutaNivel1");
    musicPlayer.pause();
  }

  info(BuildContext context) {
    Navigator.of(context).pushNamed("/rutaInfo");
    musicPlayer.pause();
  }
}
