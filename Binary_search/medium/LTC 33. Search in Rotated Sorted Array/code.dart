int search(List<int> nums, int target) {
  int s = 0, e = nums.length - 1;
  while (s <= e) {
    int m = (s + e) ~/ 2;
    if (nums[m] == target) return m;
    // Edge case: eg [3,1]
    /// s =0, m =0,
    /// we are giving guranateed that left side is always sorted thats why
    /// <= not just <
    /// 
    if (nums[s] <= nums[m]) { 
      if (nums[s] <= target && target < nums[m]) {
        e = m - 1;
      } else {
        s = m + 1;
      }
    } else {
      if (nums[m] < target && target <= nums[e]) {
        s = m + 1;
      } else {
        e = m - 1;
      }
    }
  }

  return -1;
}
