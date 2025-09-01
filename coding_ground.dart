import 'dart:collection';
import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  final a = [1, 1, 0, 0, 1, 1, 1, 0, 1];
  longestSubarray(a);
  int n = 10;
  int m = 12;
  ((m / 2).ceil() * (n / 2).floor()) + ((m / 2).floor() * (n / 2).ceil());
}

int longestSubarray(List<int> nums) {
  int left = 0;
  int right = 0;
  int ans = 0;
  bool flag = false;
  bool zeroEverFound = false;
  for (int i = 0; i < nums.length; i++) {
    int n = nums[i];
    if (n == 0 && left == 0) continue;
    bool validBreakPoint = n == 0;
    if (i + 1 < nums.length && n == 0) {
      bool didBreak = n == 0 && nums[i + 1] == 1;
      if (didBreak) {
        validBreakPoint = true;
      } else {
        ans = max(ans, left + right);
        left = 0;
        right = 0;
      }
    }
    if (validBreakPoint) {
      zeroEverFound = true;
      if (flag == true) {
        ans = max(ans, left + right);
        left = right;
        right = 0;
      } else {
        flag = true;
      }
    }
    if (flag == false && n == 1) left++;
    if (flag == true && n == 1) right++;
  }

  ans = max(ans, left + right);
  if (zeroEverFound == false) ans--;
  return ans;
}
