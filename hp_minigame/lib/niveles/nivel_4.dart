// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '/boton.dart';
import '/barrera.dart';
import '/harry.dart';
import '/camino.dart';

class Laberinto4 extends StatefulWidget {
  @override
  Cuarta createState() => Cuarta();
}

class Cuarta extends State<Laberinto4> {
// Variables que determinarán el movimiento del jugador en el mapa
  double harryX = 0;
  double harryY = 0;

// Booleano que define si el jugador está o no en movimiento
  bool walk = false;

// Generación de la cuadrícula donde se diseñará el mapa
  static int rows = 13;
  int grid = rows * 16;

// Casilla inicial del jugador
  static int player = rows * 10 + 0;

// Casilla de inicio
  int entrance = player;

// Casilla final
  int exit = rows * 0 + 11;

// Puntuación del nivel
  static int score = 100;

// Casillas con bloqueo de paso
  List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    25,
    26,
    32,
    34,
    38,
    39,
    41,
    42,
    43,
    44,
    45,
    47,
    48,
    49,
    51,
    52,
    54,
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
    82,
    88,
    90,
    91,
    93,
    95,
    96,
    97,
    99,
    101,
    103,
    104,
    106,
    110,
    112,
    114,
    116,
    117,
    119,
    121,
    122,
    123,
    125,
    126,
    127,
    129,
    134,
    138,
    142,
    143,
    145,
    146,
    147,
    149,
    151,
    153,
    154,
    155,
    156,
    158,
    162,
    164,
    168,
    169,
    171,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    181,
    182,
    184,
    194,
    195,
    197,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    210,
    216,
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
    246,
    247,
    248,
    249,
    250,
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
    263,
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
  List<int> wallsL = [14, 22, 42, 47, 71, 95, 122, 126, 146, 153, 173, 199, 204, 223];
  List<int> walls = [43, 72, 174, 175, 176, 177, 178, 200, 201, 205, 224, 225, 226, 227, 228, 229, 230];
  List<int> wallsR = [18, 23, 45, 48, 74, 96, 117, 123, 127, 147, 154, 179, 202, 206, 231];
  List<int> wallsC = [119];

// Casillas con gráfico de puerta
  List<int> doors = [16, 20];

// Casillas con gráfico de escalera
  List<int> stairs = [170, 172, 180];

// Casillas con gráfico de antorcha
  List<int> torchs = [15, 17, 44, 73, 174, 178, 201, 205, 224, 230];

// Posición inicial del jugador
  String direction = "right";

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
                image: AssetImage("assets/fondos/bg4.png"),
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
                      return MyEntranceLeft();
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
                        MyButton4(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.black,
                          ),
                          function: moveUp,
                        ),
// Izquierda
                        MyButton4(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          function: moveLeft,
                        ),
// Derecha
                        MyButton4(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          function: moveRight,
                        ),
// Abajo
                        MyButton4(
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
