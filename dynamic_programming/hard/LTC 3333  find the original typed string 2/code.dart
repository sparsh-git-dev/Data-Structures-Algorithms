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

class SolutionBottomUP {
  static const int M = 1000000007;

  int possibleStringCount(String word, int k) {
    if (k > word.length) return 0;

    // 1️⃣ Build run‑length frequencies of consecutive identical characters.
    final List<int> freq = [];
    int count = 1;
    for (int i = 1; i < word.length; i++) {
      if (word[i] == word[i - 1]) {
        count++;
      } else {
        freq.add(count);
        count = 1;
      }
    }
    freq.add(count);

    // 2️⃣ Total possible strings without the k‑rule.
    int P = 1;
    for (final f in freq) {
      P = (P * f) % M;
    }

    // If we already have at least k runs, all strings are valid.
    if (freq.length >= k) return P;

    // 3️⃣ Bottom‑up DP to count “invalid” strings (those with < k runs).
    final int n = freq.length;
    final List<List<int>> t =
        List.generate(n + 1, (_) => List.filled(k + 1, 0));

    // Base‑case: with no runs left to place, any count < k is invalid (1 way).
    for (int c = k - 1; c >= 0; c--) {
      t[n][c] = 1;
    }

    // Fill DP table backwards.
    for (int i = n - 1; i >= 0; i--) {
      for (int c = k - 1; c >= 0; c--) {
        int result = 0;
        for (int take = 1; take <= freq[i]; take++) {
          if (c + take < k) {
            result = (result + t[i + 1][c + take]) % M;
          } else {
            break; // further takes would give ≥ k runs (valid)
          }
        }
        t[i][c] = result;
      }
    }

    // 4️⃣ Subtract invalid strings from total.
    final int invalidCount = t[0][0];
    return (P - invalidCount + M) % M;
  }
}

