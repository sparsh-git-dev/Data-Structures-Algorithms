import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  final a = [1, 2, 2];
  int p = minimumPairRemoval(a);
  print(p);
}

int minimumPairRemoval(List<int> nums) {
  int ans = 0;
  bool flag = true;

  while (flag) {
    flag = false;
    int size = nums.length;
    if (size == 2) return nums[0] < nums[1] ? ans : ++ans;
    for (int i = 1; i < size; i++) {
      if (nums[i - 1] <= nums[i]) continue;
      int newNum = nums[i] + nums[i + 1];
      nums = List.from([
        ...nums.sublist(0, i),
        newNum,
        if (nums.length > i + 2) ...nums.sublist(i + 2)
      ]);
      flag = true;
      ans++;
      break;
    }
    if (nums.length > 2) {
      int s = nums.length;
      if (nums[s - 1] < nums[s - 2]) {
        ans++;
        flag = true;
        print(nums);
        nums[s - 2] = nums[s - 2] + nums[s - 1];
        nums.removeAt(s - 1);
      }
    }
  }

  return ans;
}

int search(List<int> nums, int target) {
  int s = 0, e = nums.length - 1;

  while (s <= e) {
    int m = (s + e) ~/ 2;
    if (nums[m] == target) return m;
    if (nums[s] < nums[m]) {
      if (nums[s] < target && target < nums[m]) {
        e = m - 1;
      } else {
        s = m + 1;
      }
    } else {
      if (nums[m] < target && target < nums[e]) {
        s = m + 1;
      } else {
        e = m - 1;
      }
    }
  }

  return -1;
}
