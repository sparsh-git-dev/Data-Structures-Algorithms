import 'dart:math';

class Solution {
  int findCheapestPrice(
      int n, List<List<int>> flights, int src, int dst, int k) {
    const int INF = 1 << 30;

    // cost[v] = cheapest price to reach v using the rounds processed so far
    List<int> cost = List.filled(n, INF);
    cost[src] = 0;

    // Run exactly K+1 relaxations (paths with up to K+1 flights => at most K stops)
    for (int round = 0; round <= k; round++) {
      // Use a snapshot so updates in this round don't chain within the same round
      List<int> next = List<int>.from(cost);

      for (final edge in flights) {
        int u = edge[0], v = edge[1], w = edge[2];
        if (cost[u] == INF) continue; // unreachable so far
        if (cost[u] + w < next[v]) next[v] = cost[u] + w;
      }

      cost = next;
    }

    return cost[dst] >= INF ? -1 : cost[dst];
  }
}
