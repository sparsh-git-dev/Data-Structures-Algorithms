int minimizeMax(List<int> nums, int p) {
  if (p == 0) return p;
  nums.sort();
  int res = nums.last - nums.first;
  int l = 0;
  int r = res;
  while (l <= r) {
    int mid = l + (r - l) ~/ 2;
    if (isPairPossible(nums, mid, p)) {
      res = mid;
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return res;
}

bool isPairPossible(List<int> nums, int target, int pair) {
  int pairsFound = 0;
  int i = 1;
  while (i < nums.length) {
    if ((nums[i] - nums[i - 1]).abs() <= target) {
      pairsFound++;
      i += 2;
    } else {
      i += 1;
    }
  }
  return pairsFound >= pair;
}
