import 'dart:math';

import 'package:collection/collection.dart';

int trapRainWater(List<List<int>> heightMap) {
  if (heightMap.isEmpty || heightMap[0].isEmpty) return 0;
  int waterTrapped = 0;

  int m = heightMap.length;
  int n = heightMap[0].length;

  PriorityQueue<List<int>> pq = PriorityQueue((a, b) => a[0] - b[0]);

  List<List<bool>> visited = List.generate(m, (_) => List.filled(n, false));

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (i == 0 || i == m - 1 || j == 0 || j == n - 1) {
        pq.add([heightMap[i][j], i, j]);
        visited[i][j] = true;
      }
    }
  }
  List<List<int>> directions = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0]
  ];
  while (pq.isNotEmpty) {
    List<int> val = pq.removeFirst();
    int currentHeight = val[0];
    int x = val[1];
    int y = val[2];
    for (List<int> dir in directions) {
      int nx = x + dir[0];
      int ny = y + dir[1];

      if (nx >= 0 && nx < m && ny >= 0 && ny < n && !visited[nx][ny]) {
        visited[nx][ny] = true;
        int neighborHeight = heightMap[nx][ny];
        if (neighborHeight < currentHeight) {
          waterTrapped += currentHeight - neighborHeight;
        }
        pq.add([max(neighborHeight, currentHeight), nx, ny]);
      }
    }
  }
  return waterTrapped;
}
