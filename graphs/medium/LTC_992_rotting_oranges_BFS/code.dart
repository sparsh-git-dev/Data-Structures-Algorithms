import 'dart:collection';

int orangesRotting(List<List<int>> grid) {
  int minutes = 0;
  Queue<List<int>> q = Queue();
  int fresh = 0;
  int m = grid.length;
  int n = grid[0].length;
  int rotten = 0;

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if (grid[i][j] == 2) q.add([i, j]);
      if (grid[i][j] == 1) fresh++;
    }
  }
  rotten = q.length;
  if (rotten == 0 && fresh == 0) return 0;
  while (q.isNotEmpty && fresh > 0) {
    int size = q.length;
    for (int i = 0; i < size; i++) {
      List<int> cell = q.removeFirst();
      int x = cell[0];
      int y = cell[1];
      for (List<int> d in directions) {
        int newX = x + d[0];
        int newY = y + d[1];
        if (newX >= 0 &&
            newX < m &&
            newY >= 0 &&
            newY < n &&
            grid[newX][newY] == 1) {
          q.add([newX, newY]);
          fresh--;
          grid[newX][newY] = 2;
        }
      }
    }
    minutes++;
  }

  return fresh == 0 ? minutes : -1;
}

List<List<int>> directions = [
  [-1, 0],
  [0, 1],
  [1, 0],
  [0, -1]
];
