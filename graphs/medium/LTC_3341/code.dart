import 'dart:math';
// Problem Link : https://leetcode.com/problems/find-minimum-time-to-reach-last-room-i/description/?envType=daily-question&envId=2025-05-07

// Bruteforce: recursion (TLE)

int recurMinTimeToReach(List<List<int>> moveTime) {
  int n = moveTime.length;
  int m = moveTime[0].length;
  List<List<bool>> visited = List.generate(n, (_) => List.filled(m, false));

  List<List<int>> dir = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1]
  ];

  int _helper(int i, int j, int time) {
    if (i == n - 1 && j == m - 1) return time;

    int ans = 1e9.toInt();

    for (List<int> d in dir) {
      int x = i + d[0];
      int y = j + d[1];

      if (x >= 0 && x < n && y >= 0 && y < m && !visited[x][y]) {
        visited[x][y] = true;
        int nextTime = max(time + 1, moveTime[x][y]);
        ans = min(ans, _helper(x, y, nextTime));
        visited[x][y] = false;
      }
    }

    return ans;
  }

  visited[0][0] = true;
  return _helper(0, 0, 0);
}

// Tried with Memoisation DP, but later realised we can' use DP, because the current cell
// answer is dependent on time taken by the current route

int DPminTimeToReach(List<List<int>> moveTime) {
  int n = moveTime.length;
  int m = moveTime[0].length;
  List<List<bool>> visited = List.generate(n, (_) => List.filled(m, false));

  Map<String, int> memo = {};

  List<List<int>> dir = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1]
  ];

  int _helper(int i, int j, int time) {
    if (i == n - 1 && j == m - 1) return time;

    String key = "$i,$j,$time";
    if (memo.containsKey(key)) return memo[key]!;

    int ans = 1e9.toInt();

    for (List<int> d in dir) {
      int x = i + d[0];
      int y = j + d[1];

      if (x >= 0 && x < n && y >= 0 && y < m && !visited[x][y]) {
        visited[x][y] = true;

        // Wait until moveTime[x][y] if needed
        int nextTime = max(time + 1, moveTime[x][y]);

        ans = min(ans, _helper(x, y, nextTime));
        visited[x][y] = false;
      }
    }

    memo[key] = ans;
    return ans;
  }

  visited[0][0] = true;
  return _helper(0, 0, 0);
}
