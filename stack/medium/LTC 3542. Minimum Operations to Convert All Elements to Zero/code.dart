int minOperationsUsingSet(List<int> nums) {
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

int minOperationsUsingStack(List<int> nums) {
  final List<int> st = [];
  int ops = 0;
  for (final num in nums) {
    while (st.isNotEmpty && st.last > num) st.removeLast();
    if (num == 0) continue;
    // If stack empty or top < num, push and count op
    if (st.isEmpty || st.last < num) {
      st.add(num);
      ops++;
    }
  }
  return ops;
}
