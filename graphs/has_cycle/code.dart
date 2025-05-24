// UNDIRECTED
bool hasCycle(Map<int, List<int>> graph) {
  Set<int> visited = {};

  bool dfs(int node, int parent) {
    visited.add(node);

    for (int neighbor in graph[node] ?? []) {
      if (!visited.contains(neighbor)) {
        if (dfs(neighbor, node)) return true;
      } else if (neighbor != parent) {
        return true;
      }
    }

    return false;
  }

  for (int node in graph.keys) {
    if (visited.contains(node)) continue;
    if (dfs(node, -1)) return true;
  }

  return false;
}

bool hasCycleDirected(Map<int, List<int>> graph) {
  Set<int> visited = {};
  Set<int> recStack = {};

  bool dfs(int node) {
    visited.add(node);
    recStack.add(node);

    for (int neighbor in graph[node] ?? []) {
      if (!visited.contains(neighbor)) {
        if (dfs(neighbor)) return true;
      } else if (recStack.contains(neighbor)) {
        return true;
      }
    }

    recStack.remove(node);
    return false;
  }

  for (int node in graph.keys) {
    if (visited.contains(node)) continue;
    if (dfs(node)) return true;
  }

  return false;
}
