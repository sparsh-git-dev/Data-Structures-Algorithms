import 'dart:math';

void main() {}

int lengthAfterTransformations(String s, int t) {
  int a = 'a'.codeUnitAt(0);
  List<int> freq = List.filled(26, 0);

  // Step 1: Count initial character frequencies
  for (int i = 0; i < s.length; i++) {
    int index = s.codeUnitAt(i) - a;
    freq[index]++;
  }

  // Step 2: Memoization table [charIndex][t] => length
  List<List<int>> dp = List.generate(26, (_) => List.filled(t + 1, -1));

  // Step 3: DP helper function
  int _dpHelper(int chIndex, int t) {
    if (dp[chIndex][t] != -1) return dp[chIndex][t];

    if (t == 0) {
      dp[chIndex][t] = 1;
      return 1;
    }

    int result;
    if (chIndex == 25) {
      // 'z' → "ab"
      result = _dpHelper(0, t - 1) + _dpHelper(1, t - 1);
    } else {
      // any other → next character
      result = _dpHelper(chIndex + 1, t - 1);
    }

    dp[chIndex][t] = result;
    return result;
  }

  // Step 4: Compute result using DP table
  int result = 0;
  for (int i = 0; i < 26; i++) {
    if (freq[i] > 0) {
      int len = _dpHelper(i, t);
      result += freq[i] * len;
    }
  }

  return result;
}
