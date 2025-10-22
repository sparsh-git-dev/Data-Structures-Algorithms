import 'dart:math';

import 'graphs/medium/LTC_399_evaluate_division/code.dart';

void main() {}



List<List<int>> pacificAtlantic(List<List<int>> heights) {
  int m = heights.length;
  int n = heights[0].length;
  List<List<bool>> pacificOcean =
      List.filled(m, List.generate(n, (index) => false));

  List<List<bool>> atlanticOcean =
      List.filled(m, List.generate(n, (index) => false));

  List<List<int>> ans = [];
  // top and left
  for (int i = 0; i < n; i++) {
    dfsToOcean(heights, 0, i, -1, pacificOcean);
    dfsToOcean(heights, i, 0, -1, pacificOcean);
  }
  for (int i = 0; i < m; i++) {
    dfsToOcean(heights, i, n - 1, -1, atlanticOcean);
    dfsToOcean(heights, m - 1, i, -1, atlanticOcean);
  }
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (pacificOcean[i][j] == true && atlanticOcean[i][j] == true) {
        ans.add([i, j]);
      }
    }
  }
  return ans;
}

List<List<int>> dir = [
  [0, 1],
  [1, 0],
  [0, -1],
  [-1, 0]
];
dfsToOcean(
    List<List<int>> matrix, int i, int j, int prev, List<List<bool>> visited) {
  if (visited[i][j]) return;
  int m = matrix.length;
  int n = matrix[0].length;
  visited[i][j] = true;
  for (List<int> d in dir) {
    int nx = i + d[0];
    int ny = j + d[1];
    if (nx >= 0 && ny >= 0 && nx < m && ny < n && prev < matrix[nx][ny]) {
      dfsToOcean(matrix, nx, ny, matrix[i][j], visited);
    }
  }
}
