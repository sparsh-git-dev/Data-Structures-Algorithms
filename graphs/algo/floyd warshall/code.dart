import 'dart:math';

List<List<int>> floydWarshall(int n, List<List<int>> edges) {
  const int INF = 1 << 30; // A large number representing infinity

  // Initialize distance matrix
  List<List<int>> dist = List.generate(n, (_) => List.filled(n, INF));

  for (int i = 0; i < n; i++) dist[i][i] = 0;

  // Populate initial edge weights
  for (final edge in edges) {
    int u = edge[0];
    int v = edge[1];
    int w = edge[2];
    dist[u][v] = w;
  }

  // Floyd-Warshall main logic
  for (int k = 0; k < n; k++) {
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (dist[i][k] < INF && dist[k][j] < INF) {
          dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j]);
        }
      }
    }
  }

  return dist;
}
