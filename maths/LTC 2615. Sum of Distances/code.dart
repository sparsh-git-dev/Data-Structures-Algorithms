// Reference from  maths/LTC 1685. Sum of Absolute Differences in a Sorted Array
List<int> distance(List<int> nums) {
  int n = nums.length;
  List<int> ans = List.filled(n, 0);

  Map<int, List<int>> records = {};

  for (int i = 0; i < n; i++) {
    records.putIfAbsent(nums[i], () => []);
    records[nums[i]]!.add(i);
  }

  // Process each group
  for (var entry in records.entries) {
    List<int> idxs = entry.value;
    int m = idxs.length;

    // Prefix sums of indices
    List<int> prefix = List.filled(m, 0);
    prefix[0] = idxs[0];

    for (int i = 1; i < m; i++) {
      prefix[i] = prefix[i - 1] + idxs[i];
    }

    int total = prefix[m - 1];

    for (int i = 0; i < m; i++) {
      int idx = idxs[i];

      // Left contribution
      int leftSum = 0;
      if (i > 0) {
        leftSum = i * idx - prefix[i - 1];
      }

      // Right contribution
      int rightSum = 0;
      if (i < m - 1) {
        rightSum = (total - prefix[i]) - (m - i - 1) * idx;
      }

      ans[idx] = leftSum + rightSum;
    }
  }

  return ans;
}
