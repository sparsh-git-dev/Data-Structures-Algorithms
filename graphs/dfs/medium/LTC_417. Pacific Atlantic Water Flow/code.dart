// https://editor.p5js.org/LeweyM/full/RpAxMlZL4

// https://leetcode.com/problems/pacific-atlantic-water-flow/description/?envType=daily-question&envId=2025-10-05

import '../../../annotations.dart';

@DFS()
class Solution {
  List<List<int>> pacificAtlantic(List<List<int>> heights) {
    int m = heights.length;
    int n = heights[0].length;
    List<List<bool>> pacificOcean =
        List.generate(m, (_) => List.filled(n, false));
    List<List<bool>> atlanticOcean =
        List.generate(m, (_) => List.filled(n, false));

    List<List<int>> ans = [];
    for (int i = 0; i < m; i++) {
      dfsToOcean(heights, i, 0, pacificOcean);
      dfsToOcean(heights, i, n - 1, atlanticOcean);
    }
    for (int j = 0; j < n; j++) {
      dfsToOcean(heights, 0, j, pacificOcean);
      dfsToOcean(heights, m - 1, j, atlanticOcean);
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
  dfsToOcean(List<List<int>> matrix, int i, int j, List<List<bool>> visited) {
    int m = matrix.length;
    int n = matrix[0].length;

    if (i < 0 || i >= m || j < 0 || j >= n || visited[i][j]) return;
    visited[i][j] = true;
    for (List<int> d in dir) {
      int nx = i + d[0];
      int ny = j + d[1];
      if (nx >= 0 &&
          ny >= 0 &&
          nx < m &&
          ny < n &&
          !visited[nx][ny] &&
          matrix[i][j] <= matrix[nx][ny]) {
        dfsToOcean(matrix, nx, ny, visited);
      }
    }
  }
}
