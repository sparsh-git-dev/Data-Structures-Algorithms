class Asteroid {
  int idx;
  int size;

  Asteroid(this.size, this.idx);

  bool get isMovingRight => size > 0;
  bool get isMovingLeft => size < 0;

  int get absSize => size.abs();
}

class Solution {
  List<int> asteroidCollision(List<int> asteroids) {
    List<Asteroid> stack = [];
    List<Asteroid> survivors = [];

    for (int i = 0; i < asteroids.length; i++) {
      int value = asteroids[i];
      Asteroid current = Asteroid(value, i);
      if (current.isMovingRight) {
        stack.add(current);
        continue;
      }
      bool isDestroyed = false;

      while (stack.isNotEmpty && isDestroyed == false) {
        Asteroid top = stack.last;
        if (top.absSize > current.absSize) {
          isDestroyed = true;
          break;
        } else if (top.absSize < current.absSize) {
          stack.removeLast();
        } else {
          stack.removeLast();
          isDestroyed = true;
          break;
        }
      }

      if (!isDestroyed) survivors.add(current);
    }
    survivors.addAll(stack);
    survivors.sort((a, b) => a.idx.compareTo(b.idx));

    return survivors.map((a) => a.size).toList();
  }
}