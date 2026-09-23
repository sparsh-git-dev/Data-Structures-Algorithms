import 'dart:math';

class Solution {
  int maxTotalFruits(List<List<int>> fruits, int startPos, int k) {
    int n = fruits.length;
    List<int> prefixSum = List.filled(n, 0);
    List<int> indices = List.filled(n, 0);

    // Build prefix sum and extract indices
    for (int i = 0; i < n; i++) {
      indices[i] = fruits[i][0];
      prefixSum[i] = fruits[i][1] + (i > 0 ? prefixSum[i - 1] : 0);
    }

    int maxFruits = 0;

    for (int d = 0; d <= k ~/ 2; d++) {
      // Case 1: Move left 'd' steps then right 'remain'
      int remain = k - 2 * d;
      int i = startPos - d;
      int j = startPos + remain;

      int left = lowerBound(indices, i);
      int right = upperBound(indices, j) - 1;

      if (left <= right) {
        int total = prefixSum[right] - (left > 0 ? prefixSum[left - 1] : 0);
        maxFruits = max(maxFruits, total);
      }

      // Case 2: Move right 'd' steps then left 'remain'
      remain = k - 2 * d;
      i = startPos - remain;
      j = startPos + d;

      left = lowerBound(indices, i);
      right = upperBound(indices, j) - 1;

      if (left <= right) {
        int total = prefixSum[right] - (left > 0 ? prefixSum[left - 1] : 0);
        maxFruits = max(maxFruits, total);
      }
    }

    return maxFruits;
  }

  int lowerBound(List<int> arr, int target) {
    int left = 0, right = arr.length;
    while (left < right) {
      int mid = (left + right) ~/ 2;
      if (arr[mid] < target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }

  int upperBound(List<int> arr, int target) {
    int left = 0, right = arr.length;
    while (left < right) {
      int mid = (left + right) ~/ 2;
      if (arr[mid] <= target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
}
