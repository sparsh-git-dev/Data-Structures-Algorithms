import 'dart:math';

/// https://leetcode.com/problems/closest-equal-element-queries/?envType=daily-question&envId=2026-04-16
///
///

class Solution {
  List<int> solveQueries(List<int> nums, List<int> queries) {
    List<int> ans = List.filled(queries.length, -1);
    Map<int, List<int>> record = {};

    // Store all indices for each number
    for (int i = 0; i < nums.length; i++) {
      record.putIfAbsent(nums[i], () => []);
      record[nums[i]]!.add(i);
    }

    for (int i = 0; i < queries.length; i++) {
      int queryIdx = queries[i];
      int num = nums[queryIdx];

      List<int> idxs = record[num]!;

      if (idxs.length > 1) {
        ans[i] = findMinDistance(idxs, queryIdx, nums.length);
      }
    }

    return ans;
  }

  int findMinDistance(List<int> idxs, int initialIdx, int n) {
    int foundIdx = findPosition(idxs,initialIdx);

    // Previous same-value index (circular)
    int prevIdx = idxs[(foundIdx - 1) % idxs.length];

    // Next same-value index (circular)
    int nextIdx = idxs[(foundIdx + 1) % idxs.length];

    // Circular distances
    int distPrev = circularDistance(initialIdx, prevIdx, n);
    int distNext = circularDistance(initialIdx, nextIdx, n);

    return min(distNext, distPrev);
  }

  int circularDistance(int a, int b, int n) {
    int diff = (a - b).abs();
    return min(diff, (n - diff));
  }

  int findPosition(List<int> arr, int target) {
    int left = 0;
    int right = arr.length - 1;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2;

      if (arr[mid] == target) return mid;

      if (arr[mid] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return -1; // won't happen here
  }
}
