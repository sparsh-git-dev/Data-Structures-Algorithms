import 'dart:math';

import 'package:collection/collection.dart';

import 'Linked_list/linked_list.dart';

void main() {
  final a = [
    [1, 3],
    [2, 4],
    [10, 11],
    [10, 12],
    [8, 9]
  ];
  minimumEffort(a);
}

int minimumEffort(List<List<int>> tasks) {
  int ans = 1e9.toInt();

  tasks.sort((a, b) {
    return b[1].compareTo(a[1]);
  });
  int minmFuel = 0;
  int maxmFuel = 0;

  for (List<int> task in tasks) {
    minmFuel += task[0];
    maxmFuel = max(maxmFuel, task[1]);
  }

  int s = minmFuel, e = minmFuel + maxmFuel;
  if(ableToCover(tasks,32)){
    print('object');
  }
  // while (s <= e) {
  //   int m = (s + e) ~/ 2;
  //   if (ableToCover(tasks, m)) {
  //     ans = min(m, ans);
  //     e = m - 1;
  //   } else {
  //     s = m + 1;
  //   }
  // }

  return ans;
}

bool ableToCover(List<List<int>> tasks, int fuel) {
  for (List<int> t in tasks) {
    if (fuel < t[1] || fuel <= 0) return false;
    fuel = fuel - t[0];
  }
  return true;
}
