int minOperations(List<int> nums) {
  final unique = nums.toSet();
  int n = nums.length, ops = 0;
  for (int target in unique) {
    if (target == 0) continue;
    bool flow = false;
    for (int i = 0; i < n; i++) {
      if (nums[i] == target && !flow) {
        flow = true;
        ops++;
      } else if (nums[i] < target) {
        flow = false;
      }
    }
  }
  return ops;
}
