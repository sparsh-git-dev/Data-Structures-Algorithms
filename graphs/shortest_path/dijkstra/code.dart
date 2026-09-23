import 'package:collection/collection.dart';

List<int> dijkstra(int n, List<List<List<int>>> adj, int start) {
  List<int> dist = List.filled(n, double.infinity.toInt());
  dist[start] = 0;

  // Min-heap: [distance, node]
  final priorityQueue =
      PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
  priorityQueue.add([0, start]);

  while (priorityQueue.isNotEmpty) {
    final current = priorityQueue.removeFirst();
    int currentDist = current[0];
    int node = current[1];

    if (currentDist > dist[node]) continue;

    for (final neighbor in adj[node]) {
      int v = neighbor[0];
      int weight = neighbor[1];

      if (dist[node] + weight < dist[v]) {
        dist[v] = dist[node] + weight;
        priorityQueue.add([dist[v], v]);
      }
    }
  }

  return dist;
}
