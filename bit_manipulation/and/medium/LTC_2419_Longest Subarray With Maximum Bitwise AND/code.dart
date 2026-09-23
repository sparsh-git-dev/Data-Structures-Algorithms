import 'dart:math';

int longestSubarray2Pass(List<int> nums) {
  int maxValue = nums.first;
  for (int n in nums) {
    maxValue = max(maxValue, n);
  }

  int curr = 0;
  int maxLengthFound = 0;

  for (int n in nums) {
    if (n == maxValue) {
      curr++;
      maxLengthFound = max(maxLengthFound, curr);
    } else {
      curr = 0;
    }
  }

  return maxLengthFound;
}

int longestSubarray1Pass(List<int> nums) {
  int maxVal = -1;
  int maxLen = 0;
  int currentLen = 0;

  for (int n in nums) {
    if (n > maxVal) {
      maxVal = n;
      currentLen = 1;
      maxLen = 1;
    } else if (n == maxVal) {
      currentLen++;
      if (currentLen > maxLen) maxLen = currentLen;
    } else {
      currentLen = 0;
    }
  }

  return maxLen;
}
