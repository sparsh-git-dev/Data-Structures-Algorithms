int subarraySum(List<int> nums, int k) {
  Map<int, int> sumFreq = {0: 1};
  int currentSum = 0;
  int count = 0;
  for (int n in nums) {
    currentSum += n;
    int needed = currentSum - k;
    count += (sumFreq[needed] ?? 0);
    sumFreq[currentSum] = (sumFreq[currentSum] ?? 0) + 1;
  }
  return count;
}
