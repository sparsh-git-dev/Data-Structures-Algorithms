// Problem link : https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/

int minTime(int n, List<List<int>> edges, List<bool> hasApple) {
  List<List<int>> adjMatrix = [];
  for (int i = 0; i <= edges.length; i++) adjMatrix.add([]);
  for (List<int> edg in edges) {
    int s = edg[0];
    int e = edg[1];
    adjMatrix[s].add(e);
    adjMatrix[e].add(s);
  }

  return _dfs(0, -1, adjMatrix, hasApple);
}

int _dfs(int node, int parent, List<List<int>> adj, List<bool> hasApple) {
  int result = 0;
  for (int child in adj[node]) {
    if (child == parent) continue;
    int childTime = _dfs(child, node, adj, hasApple);
    if (childTime > 0 || hasApple[child]) result += 2 + childTime;
  }
  return result;
}
