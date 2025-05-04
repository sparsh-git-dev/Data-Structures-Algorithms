import 'dart:math';

void main() {
  final t = [
    [1, 1],
    [2, 2],
    [1, 1],
    [1, 2],
    [1, 2],
    [1, 1]
  ];
  // minDominoRotations(i);
}

int minDominoRotations(List<int> tops, List<int> bottoms) {
  int n = tops.length;
  int count = n + 1;
  int steps(int target) {
    int top = 0;
    for (int i = 0; i < n; i++) {
      if (tops[i] == target) continue;
      if (bottoms[i] != target) return -1;
      top++;
    }
    int bottom = 0;
    for (int i = 0; i < n; i++) {
      if (bottoms[i] == target) continue;
      if (tops[i] != target) return -1;
      bottom++;
    }
    return min(top, bottom);
  }

  for (int i = 1; i <= 6; i++) {
    int a = steps(i);
    if (a != -1) {
      count = min(a, count);
    }
  }

  return count == n + 1 ? -1 : count;
}
