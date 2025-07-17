import 'dart:math';

class Solution {
  int _lis(List<int> nums, int index, int prevIndex, int mod) {
    if (index >= nums.length) return 0;

    int take = 0;
    if (prevIndex == -1 || (nums[prevIndex] + nums[index]) % 2 == mod) {
      take = 1 + _lis(nums, index + 1, index, mod);
    }

    int skip = _lis(nums, index + 1, prevIndex, mod);

    return max(take, skip);
  }

  int maximumLength(List<int> nums) {
    return max(_lis(nums, 0, -1, 0), _lis(nums, 0, -1, 1));
  }
}
