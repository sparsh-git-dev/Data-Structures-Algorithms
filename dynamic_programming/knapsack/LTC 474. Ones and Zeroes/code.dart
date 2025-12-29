/// https://leetcode.com/problems/ones-and-zeroes/description/

import 'dart:math';

void main() {
  final strs = ["10", "0001", "111001", "1", "0"], m = 5, n = 3;

  findMaxForm(strs, m, n);
}

int findMaxForm(List<String> strs, int m, int n) {
  // Initialize 2D DP array with zeros
  List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));

  // Process each string
  for (String word in strs) {
    int zeroCount = zeroCounts(word);
    int oneCount = oneCounts(word);
    print("word : $word ones:$oneCount zeroes : $zeroCount");

    // Loop backward to ensure each string is used at most once
    for (int i = m; i >= zeroCount; i--) {
      for (int j = n; j >= oneCount; j--) {
        dp[i][j] = max(
          dp[i][j],
          dp[i - zeroCount][j - oneCount] + 1,
        );
      }
    }
  }

  return dp[m][n];
}

// Helper to count '1's
int oneCounts(String s) {
  int count = 0;
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '1') count++;
  }
  return count;
}

// Helper to count '0's
int zeroCounts(String s) {
  int count = 0;
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '0') count++;
  }

  return count;
}
