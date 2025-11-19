import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  final a = [3, 1, 2, 1];
  final b = [0, 2];
  int ans = minOperations(b);
  print(ans);
}

int minOperations(List<int> nums) {
  PriorityQueue queue = PriorityQueue();
  if (nums.first != 0) queue.add(nums.first);
  int ans = 0;
  for (int i = 1; i < nums.length; i++) {
    int value = nums[i];
    while (queue.isNotEmpty && queue.first > value) {
      queue.removeFirst();
      ans++;
    }
    if (queue.isEmpty && value != 0 ||
        (queue.isNotEmpty && queue.contains(value))) queue.add(value);
  }
  ans += queue.toSet().length;
  return ans;
}
