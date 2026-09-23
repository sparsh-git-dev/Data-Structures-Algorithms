import 'dart:math';

int distributeCandies(int n, int limit) {
  int ways = 0;

  int minCh1 = max(0, n - 2 * limit);
  int maxCh1 = min(n, limit);

  for (int i = minCh1; i <= maxCh1; i++) {
    int remaining = n - i;

    int minCh2 = max(0, remaining - limit);
    int maxCh2 = min(remaining, limit);

    ways += (maxCh2 - minCh2 + 1);
  }

  return ways;
}
