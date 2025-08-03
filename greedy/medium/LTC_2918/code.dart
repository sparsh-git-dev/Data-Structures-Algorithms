// Problem Link : https://leetcode.com/problems/minimum-equal-sum-of-two-arrays-after-replacing-zeros/description/

import 'dart:math';

int minSum(List<int> nums1, List<int> nums2) {
  int sum1 = 0;
  int zero1 = 0;

  for (int n in nums1) {
    sum1 += n;
    if (n == 0) {
      zero1++;
      sum1 += 1;
    }
  }

  int sum2 = 0;
  int zero2 = 0;

  for (int n in nums2) {
    sum2 += n;
    if (n == 0) {
      zero2++;
      sum2 += 1;
    }
  }

  if (sum1 < sum2 && zero1 == 0) return -1;
  if (sum1 > sum2 && zero2 == 0) return -1;
  return max(sum1, sum2);
}
