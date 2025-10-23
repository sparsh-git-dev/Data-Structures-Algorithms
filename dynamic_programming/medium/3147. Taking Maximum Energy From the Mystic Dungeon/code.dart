// https://leetcode.com/problems/taking-maximum-energy-from-the-mystic-dungeon/?envType=daily-question&envId=2025-10-10

import 'dart:math';

import '../../../annotations.dart';

@dynamicProgramming()
@ClassicDynamicProgramming()
class Solution {
  int maximumEnergy(List<int> energy, int k) {
    List<int> dp = List.from(energy);
    int n = energy.length, ans = -1e9.toInt();
    for (int i = n - 1; i >= 0; i--) {
      if (i + k < n) dp[i] = energy[i] + dp[i + k];
      ans = max(ans, dp[i]);
    }
    return ans;
  }
}
