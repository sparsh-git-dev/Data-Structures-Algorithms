import 'dart:math';

import 'graphs/medium/LTC_399_evaluate_division/code.dart';

void main() {}
List<int> successfulPairs(List<int> spells, List<int> potions, int success) {
  List<int> ans = [];
  potions.sort();
  for (int s in spells) {
    int idx = leftBound(potions, s, success);
    if (idx == -1) {
      ans.add(0);
    } else {
      ans.add(potions.length - idx);
    }
  }

  return ans;
}

int leftBound(List<int> arr, int spell, int target) {
  int ans = -1;
  int l = 0;
  int r = arr.length - 1;
  while (r >= l) {
    int mid = l + (r - l) ~/ 2;
    int value = arr[mid] * spell;
    if (value >= target) {
      r = mid - l;
      ans = mid;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}
