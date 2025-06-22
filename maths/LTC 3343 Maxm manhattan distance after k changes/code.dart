import 'dart:math';

int maxDistance(String s, int k) {
  int res = 0;
  int north = 0, south = 0, east = 0, west = 0;
  for (int i = 0; i < s.length; i++) {
    String c = s[i];
    if (c == 'N')
      north++;
    else if (c == 'W')
      west++;
    else if (c == 'E')
      east++;
    else
      south++;

    int y = (north - south).abs();
    int x = (east - west).abs();
    int stepsTaken = i + 1;
    int manhattanDistance = x + y;
    int wasted = stepsTaken - manhattanDistance;
    int dis = manhattanDistance + min(2 * k, wasted);
    res = max(res, dis);
  }
  return res;
}
