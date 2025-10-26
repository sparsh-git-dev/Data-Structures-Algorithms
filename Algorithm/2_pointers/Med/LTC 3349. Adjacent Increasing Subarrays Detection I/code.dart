import 'dart:math';

class Solution {
  bool hasIncreasingSubarrays(List<int> nums, int k) {
    int prev = 0;
    int curr = 1;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        curr++;
      } else {
        prev = curr;
        curr = 1;
      }
      if (curr >= 2 * k) return true;
      if (min(curr, prev) >= k) return true;
    }
    return false;
  }
}
