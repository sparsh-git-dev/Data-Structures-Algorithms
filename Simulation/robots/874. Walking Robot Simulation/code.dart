class Solution {
  int robotSim(List<int> commands, List<List<int>> obstacles) {
    Set<String> obs = obstacles.map((o) => "${o[0]},${o[1]}").toSet();

    List<List<int>> directions = [
      [0, 1], // N
      [1, 0], // E
      [0, -1], // S
      [-1, 0] // W
    ];

    int dir = 0;
    int x = 0, y = 0;
    int maxDist = 0;

    for (int command in commands) {
      if (command == -1) {
        dir = (dir + 1) % 4; // right
      } else if (command == -2) {
        dir = (dir + 3) % 4; // left
      } else {
        for (int i = 0; i < command; i++) {
          int nx = x + directions[dir][0];
          int ny = y + directions[dir][1];

          if (obs.contains("$nx,$ny")) break;

          x = nx;
          y = ny;

          maxDist = maxDist > x * x + y * y ? maxDist : x * x + y * y;
        }
      }
    }

    return maxDist;
  }
}
