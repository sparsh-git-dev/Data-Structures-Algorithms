// Part 1

import 'dart:math';

bool isZeroArray(List<int> nums, List<List<int>> queries) {
  int n = nums.length;
  List<int> delta = List.filled(n + 1, 0);

  for (List<int> q in queries) {
    int l = q[0];
    int r = q[1];
    delta[l]++;
    delta[r + 1] -= 1;
  }

  List<int> newDelta = List.filled(n, 0);
  newDelta[0] = delta[0];
  for (int i = 1; i < n; i++) {
    newDelta[i] = newDelta[i - 1] + delta[i];
  }

  List<int> transformedNums = List.from(nums);
  for (int i = 0; i < n; i++) {
    int subtract = nums[i] - newDelta[i];
    transformedNums[i] = max(0, subtract);
  }

  print(newDelta);
  print(transformedNums);

  for (int t in transformedNums) {
    if (t != 0) return false;
  }

  return true;
}
