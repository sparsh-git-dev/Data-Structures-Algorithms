import 'dart:math';

class Solution {
  int longestSubarray(List<int> nums) {
    int longest = 0;
    int currWindowZeros = 0;
    int left = 0;
    int right = 0;

    while (right < nums.length) {
      if (nums[right] == 0) currWindowZeros++;
      while (currWindowZeros > 1) {
        if (nums[left] == 0) currWindowZeros--;
        left++;
      }
      int currentWindowSize = right - left + 1;
      longest = max(longest, currentWindowSize - 1);
      right++;
    }

    return longest;
  }
}
