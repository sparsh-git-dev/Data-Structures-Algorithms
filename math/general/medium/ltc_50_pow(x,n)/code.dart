double myPow(double x, int n) {
  if (n == 0) return 1.0;

  double result = 1.0;
  int exponent = n.abs();

  while (exponent > 0) {
    if (exponent & 1 == 1) result *= x;
    x *= x;
    exponent = exponent ~/ 2;
  }

  return n < 0 ? 1 / result : result;
}
