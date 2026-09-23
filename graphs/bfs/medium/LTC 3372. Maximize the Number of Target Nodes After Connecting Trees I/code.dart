import 'dart:collection';
import 'dart:math';

/*

* **Time complexity**:

  * Building adjacency lists: $O(E_1 + E_2)$ where $E_1$ and $E_2$ are the number of edges in `tree1` and `tree2`.
  * BFS from each node in `tree1`: $O(N \cdot (V_1 + E_1))$, where $N$ is the number of nodes in `tree1`, and $V_1$ is the average number of nodes visited within distance $k$.
  * BFS from each node in `tree2`: $O(M \cdot (V_2 + E_2))$, where $M$ is the number of nodes in `tree2`, and $V_2$ is the average number of nodes visited within distance $k - 1$.
  * Overall: The total time complexity is approximately
    $O(N \cdot \text{avgBFS}_k + M \cdot \text{avgBFS}_{k-1})$,
    where avgBFS is the average number of nodes reachable within `k` or `k-1` steps in each tree.

* **Space complexity**:

  * Adjacency lists: $O(N + E_1 + M + E_2)$
  * BFS visited sets and queues: Up to $O(N)$ and $O(M)$ in worst case
  * Result storage: $O(N)$
  * Overall: $O(N + M + E_1 + E_2)$

*/

List<int> maxTargetNodes(
    List<List<int>> edges1, List<List<int>> edges2, int k) {
  if (k == 0) return List.filled(edges1.length + 1, 1);
  int maxFound = -1;
  final int n = edges1.length, m = edges2.length;
  List<int> path = List.filled(n + 1, 0);
  List<List<int>> adjListn = List.generate(n + 1, (index) => []);
  List<List<int>> adjListm = List.generate(m + 1, (index) => []);
  for (List<int> e in edges1) {
    adjListn[e[0]].add(e[1]);
    adjListn[e[1]].add(e[0]);
  }

  for (List<int> e in edges2) {
    adjListm[e[0]].add(e[1]);
    adjListm[e[1]].add(e[0]);
  }

  for (int i = 0; i < path.length; i++) {
    path[i] = _dfs(adjListn, k, i, {});
  }
  for (int i = 0; i < adjListm.length; i++) {
    maxFound = max(maxFound, _dfs(adjListm, k - 1, i, {}));
  }
  for (int i = 0; i < path.length; i++) {
    path[i] = path[i] + maxFound;
  }

  return path;
}

int _dfs(List<List<int>> adj, int k, int node, Set<int> visited) {
  if (k == 0) return 1;
  visited.add(node);
  int count = 1;

  for (int neighbor in adj[node]) {
    if (visited.contains(neighbor)) continue;
    visited.add(neighbor);
    count += _dfs(adj, k - 1, neighbor, visited);
  }

  return count;
}

_bfs(List<List<int>> adjList, int k, int source) {
  if (k == 0) return 1;
  Queue q = Queue();
  q.add(source);
  int currentLevel = 0;
  int ans = 1;
  Set<int> visited = {};
  visited.add(source);

  while (q.isNotEmpty && currentLevel < k) {
    int size = q.length;
    for (int i = 0; i < size; i++) {
      int node = q.removeFirst();
      for (int n in adjList[node]) {
        if (visited.contains(n)) continue;
        visited.add(n);
        q.add(n);
      }
    }
    ans += q.length;
    currentLevel++;
  }

  return ans;
}
