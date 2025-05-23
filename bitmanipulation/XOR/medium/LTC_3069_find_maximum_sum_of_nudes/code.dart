int maximumValueSum(List<int> nums, int k, List<List<int>> edges) {
  List<int> res = [];
  int sum = 0;
  for (int n in nums) {
    sum += n;
    int xor = n ^ k;
    res.add(xor - n);
  }

  res.sort((a, b) => b.compareTo(a));

  for (int i = 0; i < res.length - 1; i += 2) {
    int newSum = res[i] + res[i + 1];
    if (newSum <= 0) break;
    sum += newSum;
  }
  return sum;
}
