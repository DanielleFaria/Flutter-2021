import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'Rock.dart';
import 'Bullet.dart';
import 'Spaceship.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var game = MyGame();
  Flame.images.loadAll(['spaceship.png', 'Rock.png', 'bullet.png']);
  runApp(game.widget);
}

class MyGame extends BaseGame with TapDetector {
  var spaceship = new Spaceship();
  var creationRockTimer = 0.0;
  List<Rock> rockList;

  MyGame() {
    rockList = <Rock>[];
    add(spaceship);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double t) {
    creationRockTimer += t;
    if (creationRockTimer >= 0.5) {
      creationRockTimer = 0.0;
      var rock = new Rock();
      rockList.add(rock);
      add(rock);
    }

    super.update(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
        "Player tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    spaceship.direction = details.globalPosition.dx;
    addBullet(details.globalPosition);
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
        "Player tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }

  void addBullet(Offset position) {
    Bullet bullet = new Bullet(position, rockList);
    add(bullet);
  }
} 