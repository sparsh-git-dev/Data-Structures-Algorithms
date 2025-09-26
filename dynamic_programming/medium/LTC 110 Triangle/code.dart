import 'dart:math';
// 2-D array
int minimumTotal(List<List<int>> triangle) {
  int n = triangle.length;

  List<List<int>> dp = [];
  for (List<int> level in triangle) {
    dp.add(List.filled(level.length, 0));
  }
  dp.last = triangle.last;
  for (int row = n - 2; row >= 0; row--) {
    for (int col = 0; col <= row; col++) {
      dp[row][col] =
          triangle[row][col] + min(dp[row + 1][col], dp[row + 1][col + 1]);
    }
  }
  return dp[0][0];
}
