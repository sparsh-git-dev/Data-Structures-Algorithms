// https://leetcode.com/problems/maximum-total-damage-with-spell-casting/description/?envType=daily-question&envId=2025-10-11

import 'dart:math';
import '../../../annotations.dart';

@DeleteAndEarnDP()
@BinarySearch()
@dynamicProgramming()
int maximumTotalDamage(List<int> power) {
  Map<int, int> freq = {};
  for (int p in power) freq[p] = (freq[p] ?? 0) + 1;

  List<int> keys = power.toSet().toList()..sort();

  int n = keys.length;

  List<int> memo = List.filled(n, -1);

  return _dfs(0, keys, memo, n, freq);
}

int _dfs(int i, List<int> power, List<int> memo, int size, Map<int, int> freq) {
  if (i >= size) return 0;
  if (memo[i] != -1) return memo[i];

  int skip = _dfs(i + 1, power, memo, size, freq);
  int take = freq[power[i]]! * power[i];
  int next = lowerBoound(i, size - 1, power, power[i] + 3);
  if (next != -1) take += _dfs(next, power, memo, size, freq);
  return memo[i] = max(skip, take);
}

int lowerBoound(int l, int r, List<int> keys, int target) {
  int ans = -1;
  while (r >= l) {
    int mid = l + (r - l) ~/ 2;
    if (keys[mid] >= target) {
      ans = mid;
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}

// bottom - up (L <---- R)

int maximumTotalDamageBottomUp(List<int> power) {
  Map<int, int> freq = {};
  for (int p in power) {
    freq[p] = (freq[p] ?? 0) + 1;
  }
  List<int> keys = power.toSet().toList()..sort();
  int n = keys.length;

  List<int> dp = List.filled(n, 0);
  int result = -1;

  // Step 4: Bottom-up DP loop
  for (int i = n - 1; i >= 0; i--) {
    int skip = i + 1 < n ? dp[i + 1] : 0;
    int j = _lowerBound(keys, i + 1, keys[i] + 3);
    int take = (freq[keys[i]]! * keys[i]) + (j == -1 ? 0 : dp[j]);
    dp[i] = max(take, skip);
    result = max(result, dp[i]);
  }
  return result;
}

int _lowerBound(List<int> keys, int start, int value) {
  int l = start, r = keys.length - 1, ans = -1;
  while (l <= r) {
    int mid = (l + r) >> 1;
    if (value <= keys[mid]) {
      ans = mid;
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}
