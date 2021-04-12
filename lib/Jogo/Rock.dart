import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const ComponentSize = 60.0;
const SPEED = 150.0;

class Rock extends SpriteComponent {
  Random random = new Random();
  bool remove = false;
  Rock() : super.square(ComponentSize, 'rock.png');

  @override
  void update(double t) {
    super.update(t);
    this.y += t * SPEED;
  }

  @override
  bool destroy() {
    if (this.y > 500) {
      return true;
    }
    return remove;
  }

  @override
  void resize(Size size) {
    var positionX = random.nextDouble();
    this.x = positionX * 300;
  }
}
