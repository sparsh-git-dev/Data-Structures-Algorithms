// https://leetcode.com/problems/delete-and-earn/

import 'dart:math';

import '../../../annotations.dart';

@DeleteAndEarnDP()
@BinarySearch()
@dynamicProgramming()
int deleteAndEarn(List<int> nums) {
  int result = -1;
  Map<int, int> freq = {};
  for (int num in nums) freq[num] = (freq[num] ?? 0) + 1;
  nums = nums.toSet().toList()..sort();
  int size = nums.length;
  List<int> dp = List.filled(size, 0);
  for (int i = size - 1; i >= 0; i--) {
    int skip = i + 1 < size ? dp[i + 1] : 0;

    int prev = _lowerBound(i + 1, nums, nums[i] + 2);

    int take = (freq[nums[i]]! * nums[i]) + (prev == -1 ? 0 : dp[prev]);
    dp[i] = max(take, skip);
    result = max(result, dp[i]);
  }
  return result;
}

int _lowerBound(int l, List<int> nums, int target) {
  int ans = -1, r = nums.length - 1;
  while (l <= r) {
    int mid = l + (r - l) ~/ 2;

    if (target <= mid) {
      ans = mid;
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }

  return ans;
}
