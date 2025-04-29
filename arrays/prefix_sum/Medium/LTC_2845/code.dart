// Problem: https://leetcode.com/problems/count-of-interesting-subarrays/description/
void main() {
  countInterestingSubarrays([2, 3, 5, 2, 1, 4, 2], 3, 1);
}

int countInterestingSubarrays(List<int> nums, int modulo, int k) {
  //  Transform the array
  List<int> transformed =
      nums.map((num) => (num % modulo == k ? 1 : 0)).toList();

  //  Use prefix sum with hashmap
  Map<int, int> prefixModCount = {0: 1};
  int prefixSum = 0;
  int count = 0;

  for (int val in transformed) {
    prefixSum += val;
    int currMod = prefixSum % modulo;
    int need = (currMod - k + modulo) % modulo;

    count += prefixModCount[need] ?? 0;

    ///The number of times this need has occurred previously tells us
    ///how many valid subarrays ending at current index j are "interesting".

    prefixModCount[currMod] = (prefixModCount[currMod] ?? 0) + 1;
  }

  return count;
}
