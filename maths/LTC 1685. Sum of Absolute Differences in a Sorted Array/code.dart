void main() {
  final a = [2, 3, 5];
  final r = getSumAbsoluteDifferences(a);
  print(r);
}

List<int> getSumAbsoluteDifferences(List<int> nums) {
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  List<int> prefixSum = List.filled(n, 0);
  prefixSum[0] = nums[0];

  for (int i = 1; i < n; i++) prefixSum[i] = nums[i] + prefixSum[i - 1];
  
  int totalSum = prefixSum[n - 1];
  for (int i = 0; i < n; i++) {
    int leftSum = ((i * nums[i]) - (i > 0 ? prefixSum[i - 1] : 0));
    int rightSum = (totalSum - prefixSum[i] - ((n - i - 1) * nums[i]));
    res[i] = leftSum + rightSum;
  }
  return res;
}
