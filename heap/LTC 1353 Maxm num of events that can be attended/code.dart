import 'package:collection/collection.dart';

import '../../annotations.dart';

//https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended/description/
// 1353
@Greedy()
@heap()
void main() {
  maxEvents([
    [1, 2],
    [2, 3],
    [3, 4],
    [1, 2]
  ]);
}

int maxEvents(List<List<int>> events) {
  int n = events.length;
  PriorityQueue<int> pq = PriorityQueue<int>();
  events.sort((a, b) => a[0] - b[0]);
  int day = events.first[0];

  int i = 0;
  int count = 0;

  while (i < n || pq.isNotEmpty) {
    while (i < n && events[i][0] == day) {
      pq.add(events[i][1]);
      i++;
    }
    if (pq.isNotEmpty) {
      pq.removeFirst();
      count++;
    }
    day++;
    while (pq.isNotEmpty && pq.first < day) {
      pq.removeFirst();
    }
  }

  return count;
}
