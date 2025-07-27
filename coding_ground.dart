import 'dart:collection';
import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  countHillValley([2, 4, 1, 1, 6, 5]);
}

int countHillValley(List<int> nums) {
  int ans = 0;
  int left = 0;
  int right = 2;
  int size = nums.length;
  for (int i = 1; i < size - 1; i++) {
    while (left < i && nums[left] == nums[i]) left++;
    if (nums[left] == nums[i]) continue;
    while (right < size && nums[right] == nums[i]) right++;
    if (nums[right] == nums[i]) continue;
    ans++;
    if (right == i) right += 2;
  }
  return ans;
}
