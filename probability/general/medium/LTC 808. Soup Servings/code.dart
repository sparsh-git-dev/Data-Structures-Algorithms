import '../../../annotations.dart';

@dynamicProgramming()
// Code is nself explanatory , hence no solution being provided
double soupServings(int n) {
  if (n > 4800) return 1;

  List<List<int>> ops = [
    [100, 0],
    [75, 25],
    [50, 0],
    [25, 75]
  ];

  List<List<double>> dp = List.generate(n + 1, (_) => List.filled(n + 1, -1));

  return soupServe(n, n, dp, ops);
}

double soupServe(int a, int b, List<List<double>> memo, List<List<int>> ops) {
  if (a <= 0 && b <= 0) return .5;

  if (b <= 0) return 0;

  if (a <= 0) return 1.0;

  if (memo[a][b] != -1) return memo[a][b];

  double prob = 0;

  for (List<int> op in ops) {
    prob += soupServe(a - op[0], b - op[1], memo, ops);
  }
  memo[a][b] = prob / 4;

  return memo[a][b];
}
