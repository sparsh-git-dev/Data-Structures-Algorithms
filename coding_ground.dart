import 'dart:math';

import 'package:collection/collection.dart';

import 'Linked_list/linked_list.dart';

void main() {
  asteroidsDestroyed(5, [4, 9, 23, 4]);
}

bool asteroidsDestroyed(int mass, List<int> asteroids) {
  asteroids.sort();
  int n = asteroids.length;
  int s = 0, e = n - 1;
  int ans = -1;
  int destroyed = 0;
  while (s <= e) {
    int m = (s + e) >> 1;

    if (mass >= m) {
      ans = m;
      s = m + 1;
    } else {
      e = m - 1;
    }
  }
  print(ans);
  if (ans == -1) return false;

  for (int i = ans; i >= 0; i--) {
    mass += asteroids[i];
    destroyed++;
  }
  for (int i = ans + 1; i < n; i++) {
    if (mass >= asteroids[i]) {
      mass += asteroids[i];
      destroyed++;
    }
  }

  return destroyed == n;
}
