import 'dart:math';

class Solution {
  int maxIncreasingSubarrays(List<int> nums) {
    int prev = 0;
    int curr = 1;
    int ans = 1;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        curr++;
      } else {
        prev = curr;
        curr = 1;
      }
      ans = max(ans, min(curr, prev));
      ans = max(ans, curr ~/ 2);
    }

    return ans;
  }
}
