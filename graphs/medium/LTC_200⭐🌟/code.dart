// PROBLEM : https://leetcode.com/problems/number-of-islands/description/

// ⭐🌟 MOST FREQUENTLY ASKED QUESTION
int numIslands(List<List<String>> grid) {
  int m = grid.length;
  int n = grid[0].length;
  int count = 0;
  List<List<int>> dir = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1]
  ];
  dfs(int x, int y) {
    grid[x][y] = "2";
    for (List<int> d in dir) {
      int newX = x + d[0];
      int newY = y + d[1];
      if (newX >= 0 &&
          newX < m &&
          newY >= 0 &&
          newY < n &&
          grid[newX][newY] == '1') dfs(newX, newY);
    }
  }

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (grid[i][j] == '2' || grid[i][j] == '0') continue;
      dfs(i, j);
      count++;
    }
  }

  return count;
}
