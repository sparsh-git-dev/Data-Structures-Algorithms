// TOP DOWN MEMOIZATION (TLE)
class Solution {
  int M = 1e9.toInt() + 7;
  int possibleStringCount(String word, int k) {
    if (k > word.length) return 0;
    List<int> freq = [];
    int count = 1;
    for (int i = 1; i < word.length; i++) {
      if (word[i] != word[i - 1]) {
        freq.add(count);
        count = 1;
      } else {
        count++;
      }
    }
    freq.add(count);
    int allPossibilities = 1;
    for (int f in freq) allPossibilities = (allPossibilities * f) % M;
    if (freq.length >= k) return allPossibilities;
    int size = freq.length;
    List<List<int>> dp = List.generate(size + 1, (_) => List.filled(k + 1, -1));
    return (allPossibilities - inValidCount(0, 0, freq, k, dp) + M) % M;
  }

  int inValidCount(
      int i, int count, List<int> freq, int k, List<List<int>> dp) {
    if (i >= freq.length) return count < k ? 1 : 0;
    if (dp[i][count] != -1) return dp[i][count];
    int res = 0;
    for (int take = 1; take <= freq[i]; take++) {
      if (count + take < k) {
        res += inValidCount(i + 1, count + take, freq, k, dp) % M;
      } else {
        break;
      }
    }
    return dp[i][count] = res;
  }
}
