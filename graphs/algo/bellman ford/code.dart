int? bellmanFord(int n, List<List<int>> edges, int source) {
  const int INF = 1 << 30;
  List<int> dist = List.filled(n, INF);
  dist[source] = 0;

  for (int i = 0; i < n - 1; i++) {
    bool isChanged = false;

    for (final edge in edges) {
      int u = edge[0];
      int v = edge[1];
      int w = edge[2];

      if (dist[u] < INF && dist[u] + w < dist[v]) {
        dist[v] = dist[u] + w;
        isChanged = true;
      }
    }

    if (!isChanged) break; // Optimization: early exit
  }

  // Check for negative weight cycle
  for (final edge in edges) {
    int u = edge[0];
    int v = edge[1];
    int w = edge[2];

    if (dist[u] < INF && dist[u] + w < dist[v]) {
      return v; // Node involved in negative weight cycle
    }
  }

  return null; // No negative cycle
}