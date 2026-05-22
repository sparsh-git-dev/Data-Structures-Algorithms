import 'dart:math';

int maxRotateFunction(List<int> nums) {
  int ans = 0;
  int n = nums.length;
  int fsum = 0;
  int totalSum = 0;
  for (int i = 0; i < n; i++) {
    fsum += (i * nums[i]);
    totalSum += nums[i];
  }
  ans = fsum;
  for (int i = 1; i < nums.length; i++) {
    fsum = fsum + totalSum - (n * nums[n - i]);
    ans = max(ans, (fsum));
  }

  return ans;
}
