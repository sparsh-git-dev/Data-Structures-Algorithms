int numSubseq(List<int> nums, int target) {
  int mod = 1e9.toInt() + 7;
  nums.sort();
  int n = nums.length;
  int ans = 0;

  // Precompute powers of 2 modulo mod
  List<int> power = List.filled(n, 1);
  for (int i = 1; i < n; i++) {
    power[i] = (power[i - 1] * 2) % mod;
  }

  int r = n - 1;

  for (int l = 0; l < n; l++) {
    // Shrink r until the sum is within target
    while (r >= l && nums[l] + nums[r] > target) r--;

    if (r >= l) {
      ans = (ans + power[r - l]) % mod;
    } else {
      // No point in continuing if r < l
      break;
    }
  }

  return ans;
}
