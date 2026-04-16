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
    int foundIdx = idxs.indexOf(initialIdx);

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
}
