import 'dart:math';

class Solution {
  int _lis(
      List<int> nums, int index, int prevIndex, int mod, List<List<int>> dp) {
    if (index >= nums.length) return 0;
    int dpPrevShift = prevIndex + 1;
    if (dp[dpPrevShift][index] != -1) return dp[dpPrevShift][index];

    int take = 0;
    if (prevIndex == -1 || (nums[prevIndex] + nums[index]) % 2 == mod) {
      take = 1 + _lis(nums, index + 1, index, mod, dp);
    }

    int skip = _lis(nums, index + 1, prevIndex, mod, dp);

    return dp[dpPrevShift][index] = max(take, skip);
  }

  int maximumLength(List<int> nums) {
    int n = nums.length;
    List<List<int>> dp1 =
        List.generate(n + 1, (index) => List.filled(n + 1, -1));
    List<List<int>> dp2 =
        List.generate(n + 1, (index) => List.filled(n + 1, -1));

    return max(_lis(nums, 0, -1, 0, dp1), _lis(nums, 0, -1, 1, dp2));
  }
}

class Optimised {
  int maximumLength(List<int> nums, int k) {
    int n = nums.length;
    int ans = 0;
    List<List<int>> dp = List.generate(2, (_) => List.filled(n, 1));
    for (int i = 1; i < n; i++) {
      for (int j = 0; j < i; j++) {
        int mod = (nums[i] + nums[j] + k) % k;
        dp[mod][i] = max(dp[mod][i], dp[mod][j] + 1);
        ans = max(ans, dp[mod][i]);
      }
    }
    return ans;
  }
}
