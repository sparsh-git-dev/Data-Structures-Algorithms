import 'dart:collection';
import 'dart:math';

// Problem: https://leetcode.com/problems/maximum-number-of-tasks-you-can-assign/
// Approach: Binary Search + Greedy + SplayTreeMap

void main() {
  List<int> tasks = [10, 15, 30];
  List<int> workers = [0, 10, 10, 10, 10];
  int pills = 3;
  int strength = 10;
  maxTaskAssign(tasks, workers, pills, strength);
}

int maxTaskAssign(List<int> tasks, List<int> workers, int pills, int strength) {
  tasks.sort();
  workers.sort();

  int left = 0;
  int right = min(tasks.length, workers.length);
  int answer = 0;

  while (left <= right) {
    int mid = (left + right + 1) ~/ 2;
    if (_canAssign(tasks, workers, pills, strength, mid)) {
      answer = mid;
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return answer;
}

bool _canAssign(
    List<int> tasks, List<int> workers, int pills, int strength, int k) {
  if (k == 0) return true;
  if (k > workers.length) return false;

  var availableWorkers = SplayTreeMap<int, int>();
  for (int i = workers.length - k; i < workers.length; i++) {
    availableWorkers.update(workers[i], (count) => count + 1,
        ifAbsent: () => 1);
  }

  int usedPills = 0;
  for (int i = k - 1; i >= 0; i--) {
    int task = tasks[i];
    int strongestWorker = availableWorkers.lastKey() ?? -1;

    if (strongestWorker >= task) {
      _decrementCount(availableWorkers, strongestWorker);
    } else {
      int? boostedWorkerKey =
          availableWorkers.firstKeyAfter(task - strength - 1);
      if (boostedWorkerKey == null || usedPills >= pills) {
        return false;
      }
      _decrementCount(availableWorkers, boostedWorkerKey);
      usedPills++;
    }
  }

  return true;
}

void _decrementCount(SplayTreeMap<int, int> map, int key) {
  int count = map[key]!;
  if (count == 1) {
    map.remove(key);
  } else {
    map[key] = count - 1;
  }
}
