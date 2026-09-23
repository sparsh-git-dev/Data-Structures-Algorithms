import 'dart:math';

/// https://leetcode.com/problems/minimum-total-distance-traveled/description/?envType=daily-question&envId=2026-04-14

int minimumTotalDistance(List<int> robot, List<List<int>> factory) {
  // Sort both arrays
  robot.sort();
  factory.sort((a, b) => a[0].compareTo(b[0]));

  return solve(robot, factory, 0, 0);
}

int solve(List<int> robot, List<List<int>> factory, int i, int j) {
  // If all robots repaired
  if (i == robot.length) return 0;

  // If no factories left
  if (j == factory.length) return 1e9.toInt() + 7;

  int answer = solve(robot, factory, i, j + 1); // skip this factory

  int cost = 0, pos = factory[j][0], limit = factory[j][1];

  // Try assigning robots to current factory
  for (int k = 1; k <= limit && i + k - 1 < robot.length; k++) {
    cost += (robot[i + k - 1] - pos).abs();
    answer = min(answer, cost + solve(robot, factory, i + k, j + 1));
  }

  return answer;
}
