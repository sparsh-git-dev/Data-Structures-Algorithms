import 'package:collection/collection.dart';
import 'dart:math';

class Solution {
  int swimInWater(List<List<int>> grid) {
    int n = grid.length;

    // Min-heap (priority queue): stores [time, row, col]
    PriorityQueue<List<int>> pq = PriorityQueue<List<int>>(
        (a, b) => a[0].compareTo(b[0])); // sort by time

    List<List<bool>> visited = List.generate(n, (_) => List.filled(n, false));

    // Start from (0,0)
    pq.add([grid[0][0], 0, 0]);
    visited[0][0] = true;

    final directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    while (pq.isNotEmpty) {
      var cur = pq.removeFirst();
      int time = cur[0];
      int i = cur[1];
      int j = cur[2];

      // If we've reached the bottom-right cell
      if (i == n - 1 && j == n - 1) return time;

      for (var d in directions) {
        int ni = i + d[0];
        int nj = j + d[1];
        if (ni >= 0 && nj >= 0 && ni < n && nj < n && !visited[ni][nj]) {
          visited[ni][nj] = true;
          // You can only move when water level >= grid[ni][nj]
          int newTime = max(time, grid[ni][nj]);
          pq.add([newTime, ni, nj]);
        }
      }
    }

    return -1; // Should never happen
  }
}
