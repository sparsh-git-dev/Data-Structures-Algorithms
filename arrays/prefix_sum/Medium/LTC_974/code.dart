// Problem Link:https://leetcode.com/problems/subarray-sums-divisible-by-k/description/
int subarraysDivByK(List<int> nums, int k) {
  int currSum = 0;
  int count = 0;
  Map<int, int> remainderFreq = {0: 1};
  for (int n in nums) {
    currSum += n;
    int needed = (currSum % k + k) % k;
    count += (remainderFreq[needed] ?? 0);
    remainderFreq[needed] = (remainderFreq[needed] ?? 0) + 1;
  }

  return count;
}
