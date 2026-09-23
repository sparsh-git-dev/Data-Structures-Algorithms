class Solution {
  bool check(int mid, List<int> diff, int r, int k, int n) {
    List<int> tempDiff = List<int>.from(diff);
    int cumSum = 0;

    for (int i = 0; i < n; i++) {
      cumSum += tempDiff[i];

      if (cumSum < mid) {
        int need = mid - cumSum;
        if (need > k) return false;

        k -= need;
        cumSum += need;

        // Apply difference array update
        if (i + 2 * r + 1 < n) {
          tempDiff[i + 2 * r + 1] -= need;
        }
      }
    }
    return true;
  }

  int maxPower(List<int> stations, int r, int k) {
    int n = stations.length;
    List<int> diff = List.filled(n, 0);

    // Build difference array
    for (int i = 0; i < n; i++) {
      int left = (i - r).clamp(0, n - 1);
      int right = i + r + 1;
      diff[left] += stations[i];
      if (right < n) diff[right] -= stations[i];
    }

    int left = stations.reduce((a, b) => a < b ? a : b);
    int right = stations.fold<int>(0, (a, b) => a + b) + k;
    int result = 0;

    // Binary search
    while (left <= right) {
      int mid = left + ((right - left) >> 1);

      if (check(mid, diff, r, k, n)) {
        result = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return result;
  }
}
