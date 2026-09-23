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
    // Finding the earliest ending ride
    for (int i = 0; i < firstStart.length; i++) {
      earliestFirstFinish =
          min(earliestFirstFinish, firstStart[i] + firstDuration[i]);
    }

    int earliestBothFinish = 1e9.toInt();
    // We need to add the duration no matter what,
    // first ride ended at 5, for the second ride we have option [3,7]
    // then in the ans for i =0, => 3, it occured earlier hence the max 7 is chosen,
    // for i =1, => 7, we need to wait for 2 hours , hence max(5,7) is 7,
    // either we chose i =0 or 1, we still have to add the duration of
    // that particular ride
    for (int i = 0; i < secondStart.length; i++) {
      earliestBothFinish = min(
        earliestBothFinish,
        max(earliestFirstFinish, secondStart[i]) + secondDuration[i],
      );
    }

    return earliestBothFinish;
  }
}
