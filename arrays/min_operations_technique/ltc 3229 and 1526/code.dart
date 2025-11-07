/// https://leetcode.com/problems/minimum-number-of-increments-on-subarrays-to-form-a-target-array/description/

/// https://leetcode.com/problems/minimum-operations-to-make-array-equal-to-target/description/
class Solution {
  int minimumOperations(List<int> nums, List<int> target) {
    int previousDifference = 0;
    int totalOperations = 0;

    for (int i = 0; i < nums.length; i++) {
      int currentDifference = target[i] - nums[i];

      if ((currentDifference > 0 && previousDifference < 0) ||
          (currentDifference < 0 && previousDifference > 0)) {
        totalOperations += currentDifference.abs();
      } else if (currentDifference.abs() > previousDifference.abs()) {
        totalOperations += currentDifference.abs() - previousDifference.abs();
      }

      previousDifference = currentDifference;
    }

    return totalOperations;
  }
}



