import 'dart:math';

import '../../../../annotations.dart';

@Events()
@SlidingWindow()
int maxFreeTime(int eventTime, int k, List<int> startTime, List<int> endTime) {
  int n = startTime.length;
  List<int> freeTime = List.filled(n + 1, 0);

  freeTime[0] = startTime[0];
  for (int i = 1; i < n; i++) {
    freeTime[i] = startTime[i] - endTime[i - 1];
  }
  freeTime[n] = eventTime - endTime[n - 1];
  int maxSum = 0, currSum = 0, l = 0;

  for (int r = 0; r < freeTime.length; r++) {
    currSum += freeTime[r];

    while (r - l + 1 > k + 1) {
      currSum -= freeTime[l];
      l++;
    }

    maxSum = max(maxSum, currSum);
  }
  return maxSum;
}
