// PATTERN : find minimum of maximum
class Solution {
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
    List<List<bool>> visited =
        List.generate(n, (index) => List.filled(n, false));
    bool reached = false;
    _swim(List<List<int>> grid, int i, int j) {
      if (grid[i][j] > time) return;

      visited[i][j] = true;
      if (i == n - 1 && j == n - 1) {
        reached = true;
        return;
      }
      for (List<int> d in directions) {
        int nx = i + d[0], ny = j + d[1];
        if (nx >= 0 &&
            ny >= 0 &&
            nx < n &&
            ny < n &&
            !visited[nx][ny] &&
            grid[nx][ny] <= time) _swim(grid, nx, ny);
      }
    }

    _swim(grid, 0, 0);

    return reached;
  }
}
