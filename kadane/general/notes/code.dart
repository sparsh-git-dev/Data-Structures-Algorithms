import 'dart:math';

int kadanesAlgorithm(List<int> nums) {
  int currentMax = nums[0];
  int globalMax = nums[0];

  for (int i = 1; i < nums.length; i++) {
    currentMax = currentMax > 0 ? currentMax + nums[i] : nums[i];
    globalMax = max(currentMax, globalMax);
  }

  return globalMax;
}
