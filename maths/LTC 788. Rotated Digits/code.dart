class Solution {
  int rotatedDigits(int n) {
  int ans = 0;
  for (int i = 1; i <= n; i++) {
    if (isValid(i)) {
        // print(i);
        ans++;
    }
  }
  return ans;
}

isValid(int num) {
  bool changed = false;
  while (num > 0) {
    int digit = num % 10;
    if (digit == 3 || digit == 4 || digit == 7) {
      return false;
    }
    if (digit == 2 || digit == 5 || digit == 6 || digit == 9) {
      changed = true;
    }

    num = num ~/ 10;
  }

  return changed;
}
}