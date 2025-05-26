void dfsTopoSort(
    int node, Map<int, List<int>> graph, List<bool> visited, List<int> result) {
  visited[node] = true;

  for (int neighbor in graph[node] ?? []) {
    if (!visited[neighbor]) {
      dfsTopoSort(neighbor, graph, visited, result);
    }
  }

  result.add(node); // Post-order addition
}

void topologicalSortDFS(int n, List<List<int>> edges) {
  // Step 1: Build graph
  Map<int, List<int>> graph = {};
  for (int i = 0; i < n; i++) {
    graph[i] = [];
  }

  for (var edge in edges) {
    int u = edge[0], v = edge[1];
    graph[u]!.add(v);
  }

  // Step 2: Visited array and result list
  List<bool> visited = List.filled(n, false);
  List<int> result = [];

  // Step 3: Call DFS on unvisited nodes
  for (int i = 0; i < n; i++) {
    if (!visited[i]) {
      dfsTopoSort(i, graph, visited, result);
    }
  }

  result = result.reversed.toList(); // Reverse post-order
  print("Topological Order (DFS): $result");
}

void main() {
  int n = 6;
  List<List<int>> edges = [
    [5, 2],
    [5, 0],
    [4, 0],
    [4, 1],
    [2, 3],
    [3, 1],
  ];

  topologicalSortDFS(n, edges);
}
