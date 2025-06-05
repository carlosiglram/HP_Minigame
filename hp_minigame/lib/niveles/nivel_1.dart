// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, use_key_in_widget_constructors, must_call_super

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '/main.dart';
import '/boton.dart';
import '/barrera.dart';
import '/harry.dart';
import '/camino.dart';

class Laberinto extends StatefulWidget {
  @override
  Principal createState() => Principal();
}

class Principal extends State<Laberinto> {
// Variables que determinarán el movimiento del jugador en el mapa
  double harryX = 0;
  double harryY = 0;

// Booleano que define si el jugador está o no en movimiento
  bool walk = false;

// Generación de la cuadrícula donde se diseñará el mapa
  static int rows = 13;
  int grid = rows * 16;

// Casilla inicial del jugador
  static int player = rows * 20 + 3;

// Casilla de inicio
  int entrance = player;

// Casilla final
  int exit = rows * 0 + 5;

// Puntuación del nivel
  static int score = 100;

// Casillas con bloqueo de paso
  List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    21,
    23,
    25,
    26,
    30,
    32,
    34,
    36,
    38,
    39,
    41,
    43,
    45,
    47,
    49,
    51,
    52,
    54,
    56,
    58,
    62,
    64,
    65,
    67,
    69,
    71,
    72,
    73,
    74,
    75,
    77,
    78,
    80,
    86,
    90,
    91,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    101,
    103,
    104,
    106,
    114,
    116,
    117,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    127,
    128,
    129,
    130,
    132,
    136,
    142,
    143,
    145,
    147,
    149,
    150,
    151,
    152,
    153,
    155,
    156,
    160,
    162,
    166,
    168,
    169,
    171,
    172,
    173,
    175,
    177,
    179,
    181,
    182,
    184,
    188,
    190,
    194,
    195,
    197,
    199,
    200,
    201,
    203,
    204,
    205,
    206,
    207,
    208,
    210,
    220,
    221,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    233,
    234,
    236,
    246,
    247,
    249,
    259,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285
  ];

// Casillas con gráfico de pared
  List<int> walls = [
    6,
    7,
    9,
    11,
    14,
    15,
    16,
    47,
    69,
    71,
    72,
    74,
    75,
    94,
    95,
    96,
    97,
    98,
    99,
    120,
    121,
    122,
    124,
    125,
    127,
    128,
    145,
    150,
    151,
    152,
    172,
    173,
    179,
    199,
    200,
    201,
    203,
    204,
    205,
    206,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231
  ];
  List<int> wallsL = [6, 14, 71, 74, 94, 120, 124, 127, 150, 172, 199, 203, 224];
  List<int> wallsR = [7, 16, 72, 75, 99, 122, 125, 128, 152, 173, 201, 206, 231];
  List<int> wallsC = [9, 11, 47, 69, 145, 179];

// Casillas con gráfico de puerta
  List<int> doors = [9, 11];

// Casillas con gráfico de escalera
  List<int> stairs = [118, 126];

// Casillas con gráfico de antorcha
  List<int> torchs = [15, 95, 98, 121, 151, 200, 205, 225, 230];

// Posición inicial del jugador
  String direction = "up";

// Método que define el movimiento hacia arriba
  void moveUp() {
    direction = "up";
    walk = !walk;
    setState(() {
      harryY -= 0.03;
    });
    if (!barriers.contains(player - rows)) {
      setState(() {
        player -= rows;
      });
    }
  }

// Método que define el movimiento hacia la derecha
  void moveRight() {
    direction = "right";
    walk = !walk;
    setState(() {
      harryX += 0.05;
    });
    if (!barriers.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

// Método que define el movimiento hacia la izquierda
  void moveLeft() {
    direction = "left";
    walk = !walk;
    setState(() {
      harryX -= 0.05;
    });
    if (!barriers.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

// Método que define el movimiento hacia abajo
  void moveDown() {
    direction = "down";
    walk = !walk;
    setState(() {
      harryY += 0.03;
    });
    if (!barriers.contains(player + rows)) {
      setState(() {
        player += rows;
      });
    }
  }

  @override
  initState() {
    main();
    musicaLaberintos("music/laberintos.mp3");
  }

  static AudioPlayer musicPlayerLaberintos = AudioPlayer();
  musicaLaberintos(String rutaM) {
    musicPlayerLaberintos.play(AssetSource("music/laberintos.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
// Definir fondo
                image: AssetImage("assets/fondos/bg1.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: [
              Expanded(
                flex: (MediaQuery.of(context).size.height.toInt() * 0.015).toInt(),
                child: GridView.builder(
// Bloquear scroll
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rows),
// Definir que el gráfico del jugador cambie con respecto a su movimiento (en escaleras y en suelo base)
                  itemBuilder: (BuildContext context, int index) {
                    if (player == index) {
                      switch (direction) {
                        case "left":
                          if (stairs.contains(player)) {
                            return MyHarryStairs(
                              direction: direction,
                              midrun: walk,
                            );
                          } else {
                            return MyHarry(
                              direction: direction,
                              midrun: walk,
                            );
                          }
                        case "right":
                          if (stairs.contains(player)) {
                            return MyHarryStairs(
                              direction: direction,
                              midrun: walk,
                            );
                          } else {
                            return MyHarry(
                              direction: direction,
                              midrun: walk,
                            );
                          }
                        case "up":
                          if (stairs.contains(player)) {
                            return MyHarryStairs(
                              direction: direction,
                              midrun: walk,
                            );
                          } else {
                            return MyHarry(
                              direction: direction,
                              midrun: walk,
                            );
                          }
                        case "down":
                          if (stairs.contains(player)) {
                            return MyHarryStairs(
                              direction: direction,
                              midrun: walk,
                            );
                          } else {
                            return MyHarry(
                              direction: direction,
                              midrun: walk,
                            );
                          }
                        default:
                          if (stairs.contains(player)) {
                            return MyHarryStairs(
                              direction: direction,
                              midrun: walk,
                            );
                          } else {
                            return MyHarry(
                              direction: direction,
                              midrun: walk,
                            );
                          }
                      }
// Definir el resto de gráficos según sus posiciones
                    } else if (entrance == index) {
                      return MyEntrance();
                    } else if (exit == index) {
                      return MyExit();
                    } else if (stairs.contains(index)) {
                      return MyStair();
                    } else if (torchs.contains(index)) {
                      return MyTorch();
                    } else if (doors.contains(index)) {
                      return MyDoor();
                    } else if (wallsR.contains(index)) {
                      return MyWallRight();
                    } else if (wallsL.contains(index)) {
                      return MyWallLeft();
                    } else if (wallsC.contains(index)) {
                      return MyWallCenter();
                    } else if (walls.contains(index)) {
                      return MyWall();
                    } else if (barriers.contains(index)) {
                      return MyBlock();
                    } else {
                      return MyPath();
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
// Marcador con los puntos obtenidos
                      Text(
                        " PUNTOS : ",
                        style: TextStyle(fontFamily: 'Romance', color: Colors.white, fontSize: 26),
                      ),
                      Text(
                        (score).toString(),
                        style: TextStyle(fontFamily: 'Romance', color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
// Definir botones de movimiento
              Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.transparent,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
// Arriba
                        MyButton(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.black,
                          ),
                          function: moveUp,
                        ),
// Izquierda
                        MyButton(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          function: moveLeft,
                        ),
// Derecha
                        MyButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          function: moveRight,
                        ),
// Abajo
                        MyButton(
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.black,
                          ),
                          function: moveDown,
                        )
                      ])))
            ])));
  }
}
