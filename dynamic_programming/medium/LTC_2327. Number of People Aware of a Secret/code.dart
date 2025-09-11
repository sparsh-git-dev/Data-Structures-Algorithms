class Solution {
  final int MOD = 1000000007;
  late int n, delay, forget;
  late List<int> t; // memoization array

  // f(day) = number of people who first learn the secret on "day"
  int solve(int day) {
    if (day == 1) return 1;
    if (day <= 0) return 0;

    if (t[day] != -1) return t[day];

    int result = 0;
    // people who can share today are those who learned in [day - forget + 1, day - delay]
    for (int prev = day - forget + 1; prev <= day - delay; prev++) {
      if (prev > 0) {
        result = (result + solve(prev)) % MOD;
      }
    }

    return t[day] = result;
  }

  int peopleAwareOfSecret(int n, int delay, int forget) {
    this.n = n;
    this.delay = delay;
    this.forget = forget;
    t = List.filled(n + 1, -1);

    int total = 0;
    // only count people who still remember on day n
    for (int day = n - forget + 1; day <= n; day++) {
      if (day > 0) {
        total = (total + solve(day)) % MOD;
      }
    }

    return total;
  }
}
