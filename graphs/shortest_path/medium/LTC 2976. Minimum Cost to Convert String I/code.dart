//https://leetcode.com/problems/minimum-cost-to-convert-string-i/

import 'dart:math';

int minimumCost(String source, String target, List<String> original,
    List<String> changed, List<int> cost) {
  int INF = 1e9.toInt();
  List<List<int>> dis = List.generate(26, (_) => List.filled(26, INF));

  // Diagonals
  for (int i = 0; i < 26; i++) dis[i][i] = 0;
  int aCode = 'a'.codeUnitAt(0);

  for (int i = 0; i < cost.length; i++) {
    int u = original[i].codeUnitAt(0) - aCode;
    int v = changed[i].codeUnitAt(0) - aCode;
    dis[u][v] = min(dis[u][v], cost[i]);
  }

  for (int k = 0; k < 26; k++) {
    for (int i = 0; i < 26; i++) {
      if (dis[i][k] == INF) continue;
      for (int j = 0; j < 26; j++) {
        if (dis[k][j] == INF) continue;
        dis[i][j] = min(dis[i][j], dis[i][k] + dis[k][j]);
      }
    }
  }
  int ans = 0;
  for (int i = 0; i < source.length; i++) {
    if (source[i] == target[i]) continue;
    int u = source[i].codeUnitAt(0) - aCode;
    int v = target[i].codeUnitAt(0) - aCode;
    if (dis[u][v] == INF) return -1;
    ans += dis[u][v];
  }
  return ans;
}
