// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '/boton.dart';
import '/barrera.dart';
import '/harry.dart';
import '/camino.dart';

class Laberinto3 extends StatefulWidget {
  @override
  Tercera createState() => Tercera();
}

class Tercera extends State<Laberinto3> {
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
  int exit = rows * 10 + 12;

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
    11,
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
    24,
    25,
    26,
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
    68,
    69,
    70,
    71,
    72,
    73,
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
    98,
    99,
    101,
    102,
    103,
    104,
    106,
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
    130,
    134,
    138,
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
    198,
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
    220,
    221,
    223,
    224,
    225,
    226,
    227,
    229,
    230,
    231,
    233,
    234,
    242,
    246,
    247,
    248,
    249,
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
    24,
    42,
    43,
    44,
    45,
    47,
    48,
    68,
    70,
    71,
    72,
    73,
    95,
    96,
    97,
    98,
    102,
    119,
    122,
    123,
    126,
    127,
    129,
    146,
    147,
    153,
    154,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    223,
    224,
    225,
    226,
    227,
    230,
    231
  ];
  List<int> wallsL = [14, 42, 47, 70, 95, 122, 126, 129, 146, 153, 173, 198, 223, 230];
  List<int> wallsR = [24, 45, 48, 73, 98, 123, 127, 147, 154, 179, 206, 227, 231];
  List<int> wallsC = [68, 102, 119];

// Casillas con gráfico de puerta
  List<int> doors = [];

// Casillas con gráfico de escalera
  List<int> stairs = [40, 46, 50, 170, 172, 180];

// Casillas con gráfico de antorcha
  List<int> torchs = [43, 72, 97, 174, 178, 199, 205, 226];

// Casillas con gráfico de ventana
  List<int> windows = [16, 19, 22];

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
                image: AssetImage("assets/fondos/bg3.png"),
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
                      return MyExitRight();
                    } else if (stairs.contains(index)) {
                      return MyStair();
                    } else if (torchs.contains(index)) {
                      return MyTorch();
                    } else if (doors.contains(index)) {
                      return MyDoor();
                    } else if (windows.contains(index)) {
                      return MyWindow();
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
                        MyButton3(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.black,
                          ),
                          function: moveUp,
                        ),
// Izquierda
                        MyButton3(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          function: moveLeft,
                        ),
// Derecha
                        MyButton3(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          function: moveRight,
                        ),
// Abajo
                        MyButton3(
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
