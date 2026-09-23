int removeStones(List<List<int>> stones) {
  List<List<int>> adjList = [...List.generate(stones.length, (index) => [])];
  for (int i = 0; i < stones.length; i++) {
    for (int j = i + 1; j < stones.length; j++) {
      if (stones[j][1] == stones[i][1] || stones[j][0] == stones[i][0]) {
        adjList[i].add(j);
        adjList[j].add(i);
      }
    }
  }

  List<bool> visited = List.filled(stones.length, false);
  int components = 0;
  for (int i = 0; i < visited.length; i++) {
    if (visited[i]) continue;
    _dfs(i, adjList, visited);
    components++;
  }

  return stones.length - components;
}

void _dfs(int i, List<List<int>> adjList, List<bool> visited) {
  List<int> neighBours = adjList[i];
  for (int n in neighBours) {
    if (visited[n]) continue;
    visited[n] = true;
    _dfs(n, adjList, visited);
  }
}
