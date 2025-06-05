// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '/niveles/nivel_1.dart';
import '/niveles/nivel_2.dart';
import '/niveles/nivel_3.dart';
import '/niveles/nivel_4.dart';
import '/niveles/nivel_5.dart';
import '/boton.dart';
import '/barrera.dart';
import '/harry.dart';
import '/camino.dart';

class LaberintoSnape extends StatefulWidget {
  @override
  Sexta createState() => Sexta();
}

class Sexta extends State<LaberintoSnape> {
// Variables que determinarán el movimiento del jugador en el mapa
  double harryX = 0;
  double harryY = 0;

// Booleano que define si el jugador está o no en movimiento
  bool walk = false;

// Generación de la cuadrícula donde se diseñará el mapa
  static int rows = 13;
  int grid = rows * 16;

// Casilla inicial del jugador
  static int player = rows * 20 + 6;

// Casilla inicial del jugador
  static int snape = rows * 3 + 3;

// Casilla de inicio
  int entrance = player;

// Puntuación del nivel
  static int score = 100;

  static int puntuacion = Principal.score +
      Segunda.score +
      Tercera.score +
      Cuarta.score +
      Quinta.score;
  static int puntuacionFinal = puntuacion - 25;

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
    27,
    28,
    30,
    31,
    32,
    33,
    34,
    36,
    37,
    38,
    39,
    40,
    44,
    45,
    46,
    50,
    51,
    52,
    53,
    63,
    64,
    65,
    66,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    108,
    109,
    111,
    112,
    114,
    115,
    116,
    117,
    118,
    122,
    124,
    128,
    129,
    130,
    131,
    135,
    137,
    141,
    142,
    143,
    144,
    154,
    155,
    156,
    157,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    199,
    200,
    202,
    203,
    205,
    206,
    207,
    208,
    209,
    213,
    215,
    219,
    220,
    221,
    222,
    226,
    228,
    232,
    233,
    234,
    235,
    245,
    246,
    247,
    248,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
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
    285,
    29,
    35,
    107,
    113,
    198,
    204,
    42
  ];

// Casillas con gráfico de pared
  List<int> wallsL = [28, 34, 44, 106, 112, 197, 203];
  List<int> wallsR = [30, 36, 46, 108, 114, 199, 205];
  List<int> wallsC = [135, 137, 226, 228];

// Casillas con gráfico de puerta
  List<int> doors = [29, 35, 107, 113, 198, 204];

// Casillas con gráfico de escalera
  List<int> stairs = [84, 175];

// Casillas con gráfico de antorcha
  List<int> torchs = [];

  // Casillas con gráfico de ventana
  List<int> windows = [45];

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
                image: AssetImage("assets/fondos/bg6.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: [
              Expanded(
                flex: (MediaQuery.of(context).size.height.toInt() * 0.015)
                    .toInt(),
                child: GridView.builder(
// Bloquear scroll
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rows),
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
                    } else if (snape == index) {
                      return MySnape();
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
                    } else if (barriers.contains(index)) {
                      return MyBlock();
                    } else {
                      return MyPath();
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(),
              ),
// Definir botones de movimiento
              Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.transparent,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
// Arriba
                            MyButtonSnape(
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.black,
                              ),
                              function: moveUp,
                            ),
// Izquierda
                            MyButtonSnape(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                              function: moveLeft,
                            ),
// Derecha
                            MyButtonSnape(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                              function: moveRight,
                            ),
// Abajo
                            MyButtonSnape(
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
