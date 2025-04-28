void main() {
  slidingWIndowCountSubarrays([2, 1, 4, 3, 5], 10);
}

int bruteForceCountSubarrays(List<int> nums, int k) {
  int n = nums.length;
  List<int> prefixSum = List.filled(n + 1, 0);

  for (int i = 0; i < n; i++) {
    prefixSum[i + 1] = prefixSum[i] + nums[i];
  }
  int count = 0;

  for (int start = 0; start < n; start++) {
    for (int end = start; end < n; end++) {
      int sum = prefixSum[end + 1] - prefixSum[start];
      int length = end - start + 1;
      if (sum * length < k) {
        count++;
      }
    }
  }

  return count;
}

int slidingWIndowCountSubarrays(List<int> nums, int k) {
  int n = nums.length;
  int left = 0, sum = 0;
  int count = 0;

  for (int right = 0; right < n; right++) {
    sum += nums[right];

    while (sum * (right - left + 1) >= k) {
      sum -= nums[left];
      left++;
    }
    count += (right - left + 1);
  }
  return count;
}
