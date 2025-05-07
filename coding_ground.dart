import 'dart:math';

void main() {
  int a = minTimeToReach([
    [27, 85],
    [22, 53]
  ]);
  print(a);
}

int minTimeToReach(List<List<int>> moveTime) {
  int n = moveTime.length;
  int m = moveTime[0].length;
  List<List<bool>> visited = List.generate(n, (_) => List.filled(m, false));
  List<List<int>> memo = List.generate(n, (_) => List.filled(m, -1));

  List<List<int>> dir = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1]
  ];

  int _helper(int i, int j, int time) {
    int ans = 1e6.toInt();
    if (i == n - 1 && j == m - 1) {
      ans = min(ans, time);
      return ans;
    }
    if (memo[i][j] != -1) return memo[i][j];

    for (List<int> d in dir) {
      int x = i + d[0];
      int y = j + d[1];
      if (x >= 0 && x < n && y >= 0 && y < m && !visited[x][y]) {
        visited[x][y] = true;
        int wait = moveTime[x][y];
        int nextTime = wait > time ? wait + 1 : time + 1;
        if (i == 0 && j == 0) {
          if (wait <= time) nextTime = 1 + wait;
        }
        ans = min(ans, _helper(x, y, nextTime));
        visited[x][y] = false;
      }
    }
    return memo[i][j] = ans;
  }

  visited[0][0] = true;

  return _helper(0, 0, moveTime[0][0]);
}
