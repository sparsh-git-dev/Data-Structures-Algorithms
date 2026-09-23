int minOperations(List<List<int>> grid, int x) {
  List<int> all = [];
  for (var row in grid) all.addAll(row);

  ///Suppose:
  /// x = 2
  /// You can do:
  /// 1 → 3 → 5 → 7
  /// But you can NEVER turn 1 into 2, because the difference is not divisible by 2.
  /// So for every number:
  /// (abs(grid[i][j] - target) % x == 0)
  /// must be true.
  ///

  int mod = all[0] % x;
  for (int num in all) {
    if (num % x != mod) return -1;
  }
  all.sort();

  int median = all[all.length ~/ 2];

  int operations = 0;
  for (int num in all) {
    operations += (num - median).abs() ~/ x;
  }

  return operations;
}
