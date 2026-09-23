/// https://leetcode.com/problems/check-if-there-is-a-valid-path-in-a-grid/description/?envType=daily-question&envId=2026-04-27

class Solution {
  bool hasValidPath(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    // Directions for each street type
    Map<int, List<List<int>>> directions = {
      1: [
        [0, -1],
        [0, 1]
      ], // left, right

      2: [
        [1, 0],
        [-1, 0]
      ], // down, up

      3: [
        [0, -1],
        [1, 0]
      ], // left, down

      4: [
        [0, 1],
        [1, 0]
      ], // right, down

      5: [
        [0, -1],
        [-1, 0]
      ], // left, up

      6: [
        [0, 1],
        [-1, 0]
      ], // right, up
    };

    List<List<bool>> visited = List.generate(m, (_) => List.filled(n, false));

    // Iterative DFS stack
    List<List<int>> stack = [
      [0, 0]
    ];

    visited[0][0] = true;

    while (stack.isNotEmpty) {
      var current = stack.removeLast();

      int x = current[0];
      int y = current[1];

      // Reached destination
      if (x == m - 1 && y == n - 1) {
        return true;
      }

      int streetType = grid[x][y];

      // Explore all valid directions
      for (var dir in directions[streetType]!) {
        int dx = dir[0], dy = dir[1];

        int nx = x + dx, ny = y + dy;

        // Boundary check
        if (nx < 0 || ny < 0 || nx >= m || ny >= n) continue;

        // Already visited
        if (visited[nx][ny]) continue;

        int nextStreet = grid[nx][ny];

        // Check reverse connection exists
        bool valid = false;

        for (var nextDir in directions[nextStreet]!) {
          if (nextDir[0] == -dx && nextDir[1] == -dy) {
            valid = true;
            break;
          }
        }

        if (valid) {
          visited[nx][ny] = true;
          stack.add([nx, ny]);
        }
      }
    }

    return false;
  }
}
