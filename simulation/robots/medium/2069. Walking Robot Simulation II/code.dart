class Robot {
  Map<String, List<int>> moves = {
    "N": [0, 1],
    "E": [1, 0],
    "S": [0, -1],
    "W": [-1, 0],
  };

  late final int row, col;
  late final int perimeter;

  int x = 0, y = 0;
  String currDir = 'E';

  Robot(int width, int height) {
    row = height;
    col = width;
    perimeter = 2 * (row + col) - 4;
  }

  void step(int num) {
    if (perimeter == 0) return;

    num %= perimeter;

    if (num == 0 && x == 0 && y == 0) {
      currDir = 'S';
      return;
    }

    for (int i = 0; i < num; i++) {
      while (true) {
        int nx = x + moves[currDir]![0];
        int ny = y + moves[currDir]![1];
        if (nx >= 0 && ny >= 0 && nx < col && ny < row) {
          x = nx;
          y = ny;
          break;
        } else {
          currDir = turnLeft();
        }
      }
    }
  }

  String turnLeft() {
    switch (currDir) {
      case 'N':
        return 'W';
      case 'W':
        return 'S';
      case 'S':
        return 'E';
      case 'E':
        return 'N';
      default:
        return '';
    }
  }

  List<int> getPos() => [x, y];

  String getDir() {
    switch (currDir) {
      case 'N':
        return 'North';
      case 'E':
        return 'East';
      case 'S':
        return 'South';
      case 'W':
        return 'West';
      default:
        return '';
    }
  }
}
