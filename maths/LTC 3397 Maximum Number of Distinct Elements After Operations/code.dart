// https://leetcode.com/problems/maximum-number-of-distinct-elements-after-operations/description/
class Solution {
  int maxDistinctElements(List<int> nums, int k) {
    int n = nums.length;
    nums.sort();
    int count = 0;
    int prev = -1e9.toInt();

    for (int i = 0; i < n; i++) {
      int minVal = nums[i] - k;

      if (prev < minVal) {
        // Choose nums[i] - k
        prev = minVal;
        count++;
      } else if (prev + 1 <= nums[i] + k) {
        // Choose next available distinct value greater than prev
        prev = prev + 1;
        count++;
      }
    }

    return count;
  }
}
