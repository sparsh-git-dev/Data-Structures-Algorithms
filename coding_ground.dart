import 'dart:math';

import 'package:collection/collection.dart';

void main() {}

int intersectionSizeTwo(List<List<int>> intervals) {
  intervals.sort((x, y) {
    int firstStart = x[0], firstEnd = x[1];
    int secondStart = y[0], secondEnd = y[1];
    return (firstEnd == secondEnd) ? (secondStart - firstStart) : (firstEnd - secondEnd);
  });

  int count = 2;
  int n = intervals.length;

  int b = intervals[0][1];
  int a = b - 1;

  for (int i = 1; i < n; i++) {
    int l = intervals[i][0];
    int r = intervals[i][1];

    if (a >= l) continue;

    bool flag = l > b;
    count += 1 + (flag ? 1 : 0);

    a = flag ? r - 1 : b;
    b = r;
  }

  return count;
}
