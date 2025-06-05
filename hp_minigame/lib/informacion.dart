// ignore_for_file: must_call_super

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '/main.dart';

class Informacion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _informacion();
}

class _informacion extends State<Informacion> {
  @override
  initState() {
    main();
    musicaInfo("music/info.mp3");
  }

  AudioPlayer musicPlayerInfo = AudioPlayer();
  musicaInfo(String rutaM) {
    musicPlayerInfo.play(AssetSource("music/info.mp3"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/fondos/bg_fin.png"),
              opacity: 0.8,
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Padding(padding: EdgeInsets.all(20)),
              Text("INFORMACIÓN", style: TextStyle(fontFamily: 'Dominican', color: Colors.black, fontSize: 38), textAlign: TextAlign.center),
              Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                      "Harry Potter debe llegar a clase de Pociones a tiempo si no quiere que Snape le reste puntos a Gryffindor.\nTu tarea es ayudarlo a llegar guiándolo por los laberínticos pasillos del colegio Hogwarts.\n\nComenzarás con una puntuación inicial de cien y, por cada paso que des, se te restará un punto. La puntuación final de un nivel será la restante en el momento de terminarlo.\nUna vez completados los cinco niveles, se sumarán todas las puntuaciones para obtener un registro total.\n\nPara controlar el movimiento del personaje deberás usar los botones con iconos de flecha situados en la parte inferior de la pantalla.",
                      style: TextStyle(
                        fontFamily: 'Dominican',
                        fontSize: 22,
                      ))),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    height: 50,
                    width: 200,
                    child: IconButton(
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Text("Volver al menú", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Dominican', fontSize: 22, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          menu(context);
                        }),
                  )),
            ]),
          ),
        )));
  }

  menu(BuildContext context) {
    Navigator.of(context).pushNamed("/rutaInicio");
    musicPlayerInfo.pause();
  }
}
