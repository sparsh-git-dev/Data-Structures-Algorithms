import 'dart:math';

void main() {
  // final n = 4,
  //     flights = [
  //       [0, 1, 100],
  //       [1, 2, 100],
  //       [2, 0, 100],
  //       [1, 3, 600],
  //       [2, 3, 200]
  //     ],
  //     src = 0,
  //     dst = 3,
  //     k = 1;
  final n = 3,
      flights = [
        [0, 1, 100],
        [1, 2, 100],
        [0, 2, 500]
      ],
      src = 0,
      dst = 2,
      k = 1;
  findCheapestPrice(n, flights, src, dst, k);
}

int findCheapestPrice(int n, List<List<int>> flights, int src, int dst, int k) {
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
