import 'dart:math';

import 'graphs/medium/LTC_399_evaluate_division/code.dart';

void main() {}

int swimInWater(List<List<int>> grid) {
  int ans = 0;
  int n = grid.length;
  int l = 0;
  int r = n * n - 1;

  while (l <= r) {
    int mid = l + (r - l) ~/ 2;
    if (isPossible(grid, mid)) {
      ans = mid;
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }

  return ans;
}

final directions = [
  [0, 1],
  [1, 0],
  [0, -1],
  [-1, 0]
];
bool isPossible(List<List<int>> grid, int time) {
  int n = grid.length;
  List<List<bool>> visited = List.generate(n, (index) => List.filled(n, false));
  int maxTime = 1e9.toInt();
  _swim(List<List<int>> grid, int i, int j) {
    visited[i][j] = true;
    maxTime = min(maxTime, grid[i][j]);
    for (List<int> d in directions) {
      int nx = i + d[0], ny = j + d[1];
      if (nx >= 0 && ny >= 0 && nx < n && ny < n && !visited[nx][ny])
        _swim(grid, nx, ny);
    }
  }

  _swim(grid, 0, 0);

  return maxTime <= time;
}
