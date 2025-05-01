void main() {
  List<int> tasks = [5, 9, 8, 5, 9];
  List<int> workers = [1, 6, 4, 2, 6];
  int pills = 1;
  int strength = 5;
  maxTaskAssign(tasks, workers, pills, strength);
}

int maxTaskAssign(List<int> tasks, List<int> workers, int pills, int strength) {
  tasks.sort((a, b) => b.compareTo(a));
  workers.sort((a, b) => b.compareTo(a));
  if (tasks.first > workers.first) {
    tasks.sort();
    workers.sort();
  }
  int count = 0;
  int n = tasks.length;
  int m = workers.length;

  for (int i = 0; i < n; i++) {
    if (i >= m) break;
    int req = tasks[i];
    int curr = workers[i];
    if (req <= curr) {
      count++;
      continue;
    }

    if (pills > 0) {
      int change = curr + strength;
      if (change >= req) {
        count++;
        pills--;
      }
    }
  }

  return count;
}
