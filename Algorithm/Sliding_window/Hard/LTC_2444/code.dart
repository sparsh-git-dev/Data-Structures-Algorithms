import 'dart:math';

/// Leetcode 2444. Count Subarrays With Fixed Bounds
/// https://leetcode.com/problems/count-subarrays-with-fixed-bounds/

void main() {
  // print(countSubarrays([1, 3, 5, 2, 7, 5], 1, 5)); // Output: 14
  print(countSubarrays([1, 2, 3, 1, 2, 4], 1, 3));
  // IMP : when i is at 4th index, lb -1, and we were able to get ([0,4], [1,4], [2,4]) = 3 subarrays
  // print(countSubarrays([1, 1, 1, 1], 1, 1)); // Output: 10
}

int countSubarrays(List<int> nums, int minK, int maxK) {
  int lb = -1;
  int maxFound = -1;
  int minFound = -1;

  int count = 0;

  for (int i = 0; i < nums.length; i++) {
    int n = nums[i];
    if (n > maxK || n < minK) {
      lb = i;
      maxFound = -1;
      minFound = -1;
      continue;
    }
    if (n == minK) minFound = i;
    if (n == maxK) maxFound = i;

    if (minFound != -1 && maxFound != -1) {
      int leftPointer = min(minFound, maxFound);
      count += (leftPointer - lb);
    }
  }
  return count;
}
