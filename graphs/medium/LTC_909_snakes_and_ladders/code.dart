import 'dart:collection/collection.dart';

List<int> getCoord(int num, int n) {
  int row = n - 1 - ((num - 1) ~/ n);
  int col = (num - 1) % n;

  if ((n % 2 == 1 && row % 2 == 1) || (n % 2 == 0 && row % 2 == 0)) {
    col = n - 1 - col;
  }

  return [row, col];
}

int snakesAndLadders(List<List<int>> board) {
  int n = board.length;
  List<List<bool>> visited = List.generate(n, (_) => List.filled(n, false));
  Queue<int> queue = Queue();

  queue.add(1);
  visited[n - 1][0] = true;

  int steps = 0;

  while (queue.isNotEmpty) {
    int size = queue.length;

    for (int i = 0; i < size; i++) {
      int curr = queue.removeFirst();

      if (curr == n * n) return steps;

      for (int dice = 1; dice <= 6; dice++) {
        int next = curr + dice;
        if (next > n * n) break;

        List<int> coord = getCoord(next, n);
        int r = coord[0], c = coord[1];

        if (visited[r][c]) continue;

        visited[r][c] = true;

        if (board[r][c] == -1) {
          queue.add(next);
        } else {
          queue.add(board[r][c]);
        }
      }
    }

    steps++;
  }

  return -1;
}
