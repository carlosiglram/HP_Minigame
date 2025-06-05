// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '/boton.dart';
import '/barrera.dart';
import '/harry.dart';
import '/camino.dart';

class Laberinto2 extends StatefulWidget {
  @override
  Segunda createState() => Segunda();
}

class Segunda extends State<Laberinto2> {
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
    43,
    44,
    45,
    46,
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
    66,
    67,
    69,
    71,
    73,
    74,
    75,
    76,
    77,
    78,
    82,
    84,
    86,
    90,
    91,
    93,
    94,
    95,
    97,
    99,
    101,
    103,
    104,
    110,
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
    126,
    127,
    129,
    130,
    132,
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
    162,
    164,
    168,
    169,
    170,
    171,
    172,
    173,
    175,
    177,
    178,
    179,
    181,
    182,
    188,
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
    218,
    220,
    221,
    223,
    224,
    225,
    226,
    227,
    229,
    231,
    233,
    234,
    242,
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
  List<int> walls = [
    14,
    15,
    16,
    19,
    20,
    21,
    22,
    23,
    24,
    46,
    47,
    66,
    67,
    74,
    75,
    76,
    93,
    94,
    95,
    99,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    145,
    150,
    153,
    154,
    170,
    171,
    172,
    173,
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
    206,
    223,
    224,
    225,
    226,
    227,
    231
  ];
  List<int> wallsL = [14, 19, 46, 66, 74, 93, 120, 153, 170, 177, 198, 223];
  List<int> wallsR = [16, 24, 47, 67, 76, 95, 127, 154, 173, 179, 204, 227];
  List<int> wallsC = [44, 99, 150, 145, 206, 231];

// Casillas con gráfico de puerta
  List<int> doors = [15, 22];

// Casillas con gráfico de antorcha
  List<int> torchs = [21, 23, 75, 94, 121, 126, 171, 178, 199, 203, 225];

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
                image: AssetImage("assets/fondos/bg2.png"),
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
                          return MyHarry(
                            direction: direction,
                            midrun: walk,
                          );

                        case "right":
                          return MyHarry(
                            direction: direction,
                            midrun: walk,
                          );

                        case "up":
                          return MyHarry(
                            direction: direction,
                            midrun: walk,
                          );

                        case "down":
                          return MyHarry(
                            direction: direction,
                            midrun: walk,
                          );

                        default:
                          return MyHarry(
                            direction: direction,
                            midrun: walk,
                          );
                      }
// Definir el resto de gráficos según sus posiciones
                    } else if (entrance == index) {
                      return MyEntrance();
                    } else if (exit == index) {
                      return MyExit();
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
                        MyButton2(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.black,
                          ),
                          function: moveUp,
                        ),
// Izquierda
                        MyButton2(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          function: moveLeft,
                        ),
// Derecha
                        MyButton2(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          function: moveRight,
                        ),
// Abajo
                        MyButton2(
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
