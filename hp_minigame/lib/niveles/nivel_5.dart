// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '/boton.dart';
import '/barrera.dart';
import '/harry.dart';
import '/camino.dart';

class Laberinto5 extends StatefulWidget {
  @override
  Quinta createState() => Quinta();
}

class Quinta extends State<Laberinto5> {
// Variables que determinarán el movimiento del jugador en el mapa
  double harryX = 0;
  double harryY = 0;

// Booleano que define si el jugador está o no en movimiento
  bool walk = false;

// Generación de la cuadrícula donde se diseñará el mapa
  static int rows = 13;
  int grid = rows * 16;

// Casilla inicial del jugador
  static int player = rows * 20 + 7;

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
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    30,
    38,
    39,
    41,
    42,
    43,
    45,
    46,
    47,
    49,
    51,
    52,
    56,
    58,
    62,
    64,
    65,
    67,
    69,
    71,
    73,
    74,
    75,
    77,
    78,
    80,
    84,
    88,
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
    102,
    103,
    104,
    112,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    125,
    126,
    127,
    129,
    130,
    132,
    136,
    140,
    142,
    143,
    145,
    147,
    149,
    150,
    151,
    153,
    154,
    155,
    156,
    160,
    164,
    166,
    168,
    169,
    171,
    172,
    173,
    174,
    175,
    177,
    179,
    181,
    182,
    186,
    188,
    192,
    194,
    195,
    196,
    197,
    199,
    201,
    202,
    203,
    204,
    205,
    207,
    208,
    210,
    212,
    216,
    220,
    221,
    223,
    225,
    227,
    229,
    231,
    233,
    234,
    240,
    244,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
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
  List<int> wallsL = [14, 19, 41, 46, 73, 93, 101, 120, 125, 149, 171, 201, 204];
  List<int> walls = [15, 20, 21, 22, 23, 94, 95, 96, 97, 121];
  List<int> wallsR = [16, 24, 42, 47, 74, 98, 102, 122, 126, 150, 172, 202, 205];
  List<int> wallsC = [69, 118, 145, 154, 174, 177, 196, 223, 225, 229];

// Casillas con gráfico de puerta
  List<int> doors = [15, 22];

// Casillas con gráfico de escalera
  List<int> stairs = [92, 100];

// Casillas con gráfico de antorcha
  List<int> torchs = [21,23,94,97,121];

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
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
// Definir fondo
                image: AssetImage("assets/fondos/bg5.png"),
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
                        MyButton5(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.black,
                          ),
                          function: moveUp,
                        ),
// Izquierda
                        MyButton5(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          function: moveLeft,
                        ),
// Derecha
                        MyButton5(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          function: moveRight,
                        ),
// Abajo
                        MyButton5(
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
