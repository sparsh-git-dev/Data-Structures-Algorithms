import 'dart:math';

class Solution {
  int maxTotalFruits(List<List<int>> fruits, int startPos, int k) {
    int left = 0, sum = 0, maxFruits = 0;

    for (int right = 0; right < fruits.length; right++) {
      sum += fruits[right][1];

      while (left <= right &&
          _minSteps(fruits[left][0], fruits[right][0], startPos) > k) {
        sum -= fruits[left][1];
        left++;
      }

      maxFruits = max(maxFruits, sum);
    }

    return maxFruits;
  }

  int _minSteps(int left, int right, int start) {
    int goLeft = (start - left).abs() + (right - left);
    int goRight = (start - right).abs() + (right - left);
    return min(goLeft, goRight);
  }
}
