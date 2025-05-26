import 'dart:collection';

void kahnTopologicalSort(int n, List<List<int>> edges) {
  // Step 1: Initialize graph and indegree array
  Map<int, List<int>> graph = {};
  List<int> indegree = List.filled(n, 0);

  for (var i = 0; i < n; i++) {
    graph[i] = [];
  }

  for (var edge in edges) {
    int u = edge[0], v = edge[1];
    graph[u]!.add(v);
    indegree[v]++;
  }

  // Step 2: Queue for nodes with 0 indegree
  Queue<int> queue = Queue();
  for (int i = 0; i < n; i++) {
    if (indegree[i] == 0) queue.add(i);
  }

  // Step 3: Process queue
  List<int> topoOrder = [];
  while (queue.isNotEmpty) {
    int node = queue.removeFirst();
    topoOrder.add(node);

    for (int neighbor in graph[node]!) {
      indegree[neighbor]--;
      if (indegree[neighbor] == 0) {
        queue.add(neighbor);
      }
    }
  }

  // Step 4: Check if topological sort is possible
  if (topoOrder.length != n) {
    print("Graph has a cycle. Topological sort not possible.");
  } else {
    print("Topological Order: $topoOrder");
  }
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

  kahnTopologicalSort(n, edges);
}
