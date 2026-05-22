class Solution {
  int maxScore(List<List<int>> grid, int k) {
    int m = grid.length;
    int n = grid[0].length;

    // dp[i][j][c] = maximum score reaching (i,j) with cost c
    List<List<List<int>>> dp = List.generate(
      m,
      (_) => List.generate(
        n,
        (_) => List.filled(k + 1, -1),
      ),
    );

    int startVal = grid[0][0];
    int startCost = (startVal == 0) ? 0 : 1;
    int startScore = startVal;

    if (startCost > k) return -1;

    dp[0][0][startCost] = startScore;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        for (int cost = 0; cost <= k; cost++) {
          if (dp[i][j][cost] == -1) continue;

          // Move Down
          if (i + 1 < m) {
            int val = grid[i + 1][j];
            int addCost = (val == 0) ? 0 : 1;
            int newCost = cost + addCost;

            if (newCost <= k) {
              int newScore = dp[i][j][cost] + val;

              dp[i + 1][j][newCost] = dp[i + 1][j][newCost] > newScore
                  ? dp[i + 1][j][newCost]
                  : newScore;
            }
          }

          // Move Right
          if (j + 1 < n) {
            int val = grid[i][j + 1];
            int addCost = (val == 0) ? 0 : 1;
            int newCost = cost + addCost;

            if (newCost <= k) {
              int newScore = dp[i][j][cost] + val;

              dp[i][j + 1][newCost] = dp[i][j + 1][newCost] > newScore
                  ? dp[i][j + 1][newCost]
                  : newScore;
            }
          }
        }
      }
    }

    int ans = -1;

    for (int cost = 0; cost <= k; cost++) {
      ans = ans > dp[m - 1][n - 1][cost] ? ans : dp[m - 1][n - 1][cost];
    }

    return ans;
  }
}

int rotatedDigits(int n) {
  int ans = 0;
  for (int i = 1; i < n; i++) {
    if (!isValid(i)) ans++;
  }
  return ans;
}

isValid(int num) {
  bool changed = false;
  while (num > 0) {
    int digit = num % 10;
    if (digit == 3 || digit == 4 || digit == 7) {
      return false;
    }
    if (digit == 2 || digit == 5 || digit == 6 || digit == 9) {
      changed = true;
    }

    num = num ~/ 10;
  }

  return changed;
}
