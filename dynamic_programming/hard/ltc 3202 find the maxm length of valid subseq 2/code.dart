import 'dart:math';

class Solution {
  int maximumLength(List<int> nums, int k) {
    int n = nums.length;
    int ans = 0;
    List<List<int>> dp = List.generate(k, (_) => List.filled(n, 1));
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