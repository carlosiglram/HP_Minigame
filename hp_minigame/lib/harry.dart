import 'package:flutter/material.dart';

class MyHarry extends StatelessWidget {
  final direction;
  final midrun;

  MyHarry({this.direction, this.midrun});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(width: 52, height: 50, child: midrun ? Image.asset('assets/harry/harry_right_walk.png') : Image.asset('assets/harry/harry_right.png'));
    }
    if (direction == "left") {
      return Container(width: 50, height: 50, child: midrun ? Image.asset('assets/harry/harry_left_walk.png') : Image.asset('assets/harry/harry_left.png'));
    }
    if (direction == "up") {
      return Container(width: 50, height: 50, child: midrun ? Image.asset('assets/harry/harry_back_walk.png') : Image.asset('assets/harry/harry_back.png'));
    }
    if (direction == "down") {
      return Container(width: 50, height: 50, child: midrun ? Image.asset('assets/harry/harry_front_walk.png') : Image.asset('assets/harry/harry_front.png'));
    } else {
      return Container(width: 52, height: 52, child: Image.asset('assets/harry/harry_front.png'));
    }
  }
}

class MyHarryStairs extends StatelessWidget {
  final direction;
  final midrun;

  MyHarryStairs({this.direction, this.midrun});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(width: 50, height: 50, child: midrun ? Image.asset('assets/harry/harry_stairs_right_walk.png') : Image.asset('assets/harry/harry_stairs_right.png'));
    }
    if (direction == "left") {
      return Container(width: 50, height: 50, child: midrun ? Image.asset('assets/harry/harry_stairs_left_walk.png') : Image.asset('assets/harry/harry_stairs_left.png'));
    }
    if (direction == "up") {
      return Container(width: 50, height: 50, child: midrun ? Image.asset('assets/harry/harry_stairs_back_walk.png') : Image.asset('assets/harry/harry_stairs_back.png'));
    }
    if (direction == "down") {
      return Container(width: 50, height: 50, child: midrun ? Image.asset('assets/harry/harry_stairs_front_walk.png') : Image.asset('assets/harry/harry_stairs_front.png'));
    } else {
      return Container(width: 52, height: 52, child: Image.asset('assets/harry/harry_stairs_front.png'));
    }
  }
}
