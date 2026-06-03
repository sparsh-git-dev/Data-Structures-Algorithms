import 'dart:math';

class Solution {
  int earliestFinishTime(List<int> landStartTime, List<int> landDuration,
      List<int> waterStartTime, List<int> waterDuration) {
    return min(
      bestFinishTime(
          landStartTime, landDuration, waterStartTime, waterDuration),
      bestFinishTime(
          waterStartTime, waterDuration, landStartTime, landDuration),
    );
  }

  int bestFinishTime(List<int> firstStart, List<int> firstDuration,
      List<int> secondStart, List<int> secondDuration) {
    int earliestFirstFinish = 1e9.toInt();
    for (int i = 0; i < firstStart.length; i++) {
      earliestFirstFinish =
          min(earliestFirstFinish, firstStart[i] + firstDuration[i]);
    }

    int earliestBothFinish = 1e9.toInt();
    for (int i = 0; i < secondStart.length; i++) {
      earliestBothFinish = min(
        earliestBothFinish,
        max(earliestFirstFinish, secondStart[i]) + secondDuration[i],
      );
    }

    return earliestBothFinish;
  }
}
