import 'dart:math';
import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Rock.dart';
import 'Spaceship.dart';

const ComponentSize = 30.0;
const SPEED = 150.0;

class Bullet extends SpriteComponent {
  Offset initialDirection;
  List<Rock> rockList;
  var bulletDestroy = false;

  Bullet(this.initialDirection, this.rockList)
      : super.square(ComponentSize, 'bullet.png');

  @override
  void update(double t) {
    super.update(t);
    this.y -= t * SPEED;

    if (rockList.isNotEmpty) {
      rockList.forEach((rock) {
        if (!rock.remove) {
          bool remove = this.toRect().contains(rock.toRect().bottomCenter) ||
              this.toRect().contains(rock.toRect().bottomLeft) ||
              this.toRect().contains(rock.toRect().bottomRight);
          if (remove) {
            rock.remove = true;
            bulletDestroy = true;
          }
        }
      });
    }
  }

  @override
  bool destroy() {
    if (this.y < 0) {
      return true;
    }
    return bulletDestroy;
  }

  @override
  void resize(Size size) {
    this.x = this.initialDirection.dx + 15;
    this.y = size.height - 55;
  }
}