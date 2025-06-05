import 'package:flutter/material.dart';

class MyBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Image.asset('assets/block.png'),
    );
  }
}

class MyWall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Image.asset('assets/wall.png'),
    );
  }
}

class MyWallRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Image.asset('assets/wall_right.png'),
    );
  }
}

class MyWallLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Image.asset('assets/wall_left.png'),
    );
  }
}

class MyWallCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/wall_center.png')),
    );
  }
}

class MyDoor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/door.png')),
    );
  }
}

class MyWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Image.asset('assets/window.png'),
    );
  }
}

class MyTorch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/torch.gif')),
    );
  }
}

class MySnape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(child: Image.asset('assets/snape.png')),
    );
  }
}
