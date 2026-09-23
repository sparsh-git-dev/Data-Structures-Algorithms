import 'dart:collection';

class Solution {
  bool findSafeWalk(List<List<int>> grid, int health) {
    int rows = grid.length;
    int cols = grid[0].length;

    // Right, Down, Left, Up
    List<List<int>> directions = [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0],
    ];

    Queue<List<int>> queue = Queue();

    // Initial health after entering the starting cell
    int initialHealth = grid[0][0] == 1 ? health - 1 : health;

    // Queue stores: [row, col, remainingHealth]
    queue.add([0, 0, initialHealth]);

    // bestHealth[row][col] = maximum health seen at this cell
    List<List<int>> bestHealth =
        List.generate(rows, (_) => List.filled(cols, -1));

    bestHealth[0][0] = initialHealth;

    while (queue.isNotEmpty) {
      List<int> currentState = queue.removeFirst();

      int currentRow = currentState[0];
      int currentCol = currentState[1];
      int remainingHealth = currentState[2];

      // Destination reached
      if (currentRow == rows - 1 &&
          currentCol == cols - 1 &&
          remainingHealth >= 1) {
        return true;
      }

      for (List<int> direction in directions) {
        int nextRow = currentRow + direction[0];
        int nextCol = currentCol + direction[1];

        bool isInsideGrid =
            nextRow >= 0 && nextRow < rows && nextCol >= 0 && nextCol < cols;

        if (!isInsideGrid) continue;

        int nextHealth = remainingHealth - grid[nextRow][nextCol];

        // Visit only if:
        // 1. Health is still positive.
        // 2. This path reaches the cell with more health than before.
        if (nextHealth >= 1 && nextHealth > bestHealth[nextRow][nextCol]) {
          bestHealth[nextRow][nextCol] = nextHealth;

          queue.add([
            nextRow,
            nextCol,
            nextHealth,
          ]);
        }
      }
    }

    return false;
  }
}
