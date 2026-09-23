import 'package:collection/collection.dart';

class Manager {
  final int userId;
  final int taskId;
  int priority;
  Manager(this.userId, this.taskId, this.priority);
}

class TaskManager {
  final PriorityQueue<Manager> queue;
  final Map<int, Manager> record = {};

  TaskManager(List<List<int>> tasks)
      : queue = PriorityQueue((a, b) {
          if (a.priority == b.priority) {
            return b.taskId.compareTo(a.taskId); // higher taskId wins
          }
          return b.priority.compareTo(a.priority); // higher priority wins
        }) {
    for (var task in tasks) {
      final m = Manager(task[0], task[1], task[2]);
      queue.add(m);
      record[m.taskId] = m;
    }
  }

  void add(int userId, int taskId, int priority) {
    final m = Manager(userId, taskId, priority);
    queue.add(m);
    record[taskId] = m;
  }

  void edit(int taskId, int newPriority) {
    // just update the map with a new Manager (lazy delete old one)
    final old = record[taskId]!;
    final updated = Manager(old.userId, taskId, newPriority);
    queue.add(updated);
    record[taskId] = updated;
  }

  void rmv(int taskId) {
    // lazy delete: remove from record only
    record.remove(taskId);
  }

  int execTop() {
    while (queue.isNotEmpty) {
      final top = queue.removeFirst();
      final latest = record[top.taskId];
      if (latest == null) {
        // task was removed -> skip
        continue;
      }
      if (latest.priority != top.priority) {
        // outdated version -> skip
        continue;
      }
      // valid task -> execute
      record.remove(top.taskId);
      return top.userId;
    }
    return -1; // no tasks
  }
}
