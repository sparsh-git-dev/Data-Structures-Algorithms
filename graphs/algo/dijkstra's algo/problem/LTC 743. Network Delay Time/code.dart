import 'package:collection/collection.dart';
import 'dart:math';

class Solution {
  int networkDelayTime(List<List<int>> edges, int nodeCount, int startNode) {
    const int infinity = 1000000;

    // Build adjacency list: { sourceNode: [[targetNode, travelTime], ...] }
    Map<int, List<List<int>>> adjacencyList = {};
    for (List<int> edge in edges) {
      int source = edge[0];
      int target = edge[1];
      int travelTime = edge[2];

      adjacencyList.putIfAbsent(source, () => []);
      adjacencyList[source]!.add([target, travelTime]);
    }

    // Distance array: shortest known time to each node
    List<int> minDistance = List.filled(nodeCount + 1, infinity);
    minDistance[startNode] = 0;

    // Min-heap priority queue: stores [node, currentDistance]
    PriorityQueue<List<int>> priorityQueue =
        PriorityQueue((a, b) => a[1].compareTo(b[1]));
    priorityQueue.add([startNode, 0]);

    // Dijkstra’s algorithm
    while (priorityQueue.isNotEmpty) {
      List<int> current = priorityQueue.removeFirst();
      int currentNode = current[0];
      int currentTime = current[1];

      if (currentTime > minDistance[currentNode]) continue;
      if (adjacencyList[currentNode] == null) continue;

      for (final neighbor in adjacencyList[currentNode]!) {
        int nextNode = neighbor[0];
        int edgeWeight = neighbor[1];

        if (minDistance[currentNode] + edgeWeight < minDistance[nextNode]) {
          minDistance[nextNode] = minDistance[currentNode] + edgeWeight;
          priorityQueue.add([nextNode, minDistance[nextNode]]);
        }
      }
    }

    // Find the maximum time among all reachable nodes
    int maxDelay = minDistance.sublist(1).reduce((a, b) => max(a, b));

    return maxDelay == infinity ? -1 : maxDelay;
  }
}
