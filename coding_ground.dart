import 'dart:collection';
import 'dart:math';

import 'package:collection/collection.dart';

void main() {}

int minimizeMax(List<int> nums, int p) {
  if (p == 0) return p;
  nums.sort();
  int res = nums.last - nums.first;
  int l = nums.first;
  int r = res;
  while (l <= r) {
    int mid = l + (r - l) ~/ 2;
    if (isPairPossible(nums, mid, p)) {
      res = mid;
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return res;
}

bool isPairPossible(List<int> nums, int target, int pair) {
  int pairsFound = 0;
  for (int i = 1; i < nums.length; i++) {
    if ((nums[i] - nums[i - 1]).abs() <= target) pairsFound++;
  }
  return pairsFound == pair;
}
