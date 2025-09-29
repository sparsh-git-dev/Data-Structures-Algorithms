import 'dart:math';

int minScoreTriangulation(List<int> values) {
  int n = values.length;
  List<List<int>> memo = List.generate(n, (_) => List.filled(n, -1));

  int solve(int i, int j) {
    if (j - i < 2) return 0;
    if (memo[i][j] != -1) return memo[i][j];

    int ans = 1e9.toInt();
    for (int k = i + 1; k < j; k++) {
      int score = solve(i, k) + values[i] * values[j] * values[k] +solve(k, j);
      ans = min(score, ans);
    }
    return memo[i][j] = ans;
  }

  return solve(0, n - 1);
}
 